// VM Dependency Agent Extensions

module "da_def" {
  source                  = "./modules/policy/definition"
  for_each                = local.gen_condition
  definition_name         = "${var.mg_identification}-da-${each.key}"
  definition_display_name = "${upper(var.mg_identification)} - VM Dependency Agent ${each.key}"
  definition_mode         = "Indexed"
  mg_id                   = data.azurerm_management_group.ccc.id
  definition_metadata = jsonencode(
    {
      "category" : "Security"
    }
  )
  definition_parameters = jsonencode(
    {
      "effect" : {
        "type" : "String",
        "metadata" : {
          "displayName" : "Effect",
          "description" : "Enable or disable the execution of the policy"
        },
        "allowedValues" : [
          "DeployIfNotExists",
          "Disabled"
        ],
        "defaultValue" : "DeployIfNotExists"
      },
      "listOfApplicableLocations" : {
        "type" : "Array",
        "metadata" : {
          "displayName" : "Applicable Locations",
          "description" : "The list of locations where the policy should be applied.",
          "strongType" : "location"
        },
        "defaultValue" : [
          "australiasoutheast",
          "australiaeast",
          "brazilsouth",
          "canadacentral",
          "centralindia",
          "centralus",
          "eastasia",
          "eastus2euap",
          "eastus",
          "eastus2",
          "francecentral",
          "japaneast",
          "koreacentral",
          "northcentralus",
          "northeurope",
          "norwayeast",
          "southcentralus",
          "southeastasia",
          "switzerlandnorth",
          "uaenorth",
          "uksouth",
          "westcentralus",
          "westeurope",
          "westus",
          "westus2"
        ]
      }
    }
  )
  definition_policy_rule = jsonencode(
    {
      "if" : jsondecode(each.value.rule),
      "then" : {
        "effect" : "[parameters('effect')]",
        "details" : {
          "type" : "Microsoft.Compute/virtualMachines/extensions",
          "roleDefinitionIds" : [
            "/providers/Microsoft.Authorization/roleDefinitions/92aaf0da-9dab-42b6-94a3-d43ce8d16293"
          ],
          "existenceCondition" : {
            "allOf" : [
              {
                "field" : "Microsoft.Compute/virtualMachines/extensions/type",
                "equals" : each.value.dependency_agent_type
              },
              {
                "field" : "Microsoft.Compute/virtualMachines/extensions/publisher",
                "equals" : each.value.dependency_agent_publisher
              },
              {
                "field" : "Microsoft.Compute/virtualMachines/extensions/provisioningState",
                "equals" : "Succeeded"
              }
            ]
          },
          "deployment" : {
            "properties" : {
              "mode" : "incremental",
              "template" : {
                "$schema" : "http://schema.management.azure.com/schemas/2015-01-01/deploymentTemplate.json#",
                "contentVersion" : "1.0.0.0",
                "parameters" : {
                  "vmName" : {
                    "type" : "string"
                  },
                  "location" : {
                    "type" : "string"
                  }
                },
                "resources" : [
                  {
                    "type" : "Microsoft.Compute/virtualMachines/extensions",
                    "apiVersion" : "2019-07-01",
                    "name" : "[concat(parameters('vmName'),'/${each.value.dependency_agent_name}')]",
                    "location" : "[parameters('location')]",
                    "properties" : {
                      "publisher" : each.value.dependency_agent_publisher,
                      "type" : each.value.dependency_agent_type,
                      "typeHandlerVersion" : each.value.dependency_agent_version,
                      "enableAutomaticUpgrade" : true,
                      "autoUpgradeMinorVersion" : true,
                      "settings" : {}
                    }
                  }
                ]
              },
              "parameters" : {
                "vmName" : {
                  "value" : "[field('name')]"
                },
                "location" : {
                  "value" : "[field('location')]"
                }
              }
            }
          }
        }
      }
    }
  )
}

resource "azurerm_policy_set_definition" "dependency_agent" {
  name                = "${var.mg_identification}-vm-da-pol-set"
  display_name        = "${upper(var.mg_identification)} - VM Dependency Agent Set"
  policy_type         = "Custom"
  management_group_id = data.azurerm_management_group.ccc.id
  metadata = jsonencode(
    {
      "category" : "Security"
    }
  )
  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/84cfed75-dfd4-421b-93df-725b479d356a"
    parameter_values = jsonencode(
      {
        "enableProcessesAndDependencies" : {
          "type" : "Boolean",
          "metadata" : {
            "displayName" : "Enable Processes and Dependencies",
            "description" : "This is the flag for enabling processes and dependencies data collection in VMInsights. If you are using this standalone policy and what to install Dependency Agent, keep this value as true."
          },
          "value" : true
        }
      }
    )
  }
  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/08a4470f-b26d-428d-97f4-7e3e9c92b366"
    parameter_values = jsonencode(
      {
        "enableProcessesAndDependencies" : {
          "type" : "Boolean",
          "metadata" : {
            "displayName" : "Enable Processes and Dependencies",
            "description" : "This is the flag for enabling processes and dependencies data collection in VMInsights. If you are using this standalone policy and what to install Dependency Agent, keep this value as true."
          },
          "value" : true
        }
      }
    )
  }
  policy_definition_reference {
    policy_definition_id = module.da_def["Windows"].output_definition_id
    parameter_values     = jsonencode({})
  }
  policy_definition_reference {
    policy_definition_id = module.da_def["Linux"].output_definition_id
    parameter_values     = jsonencode({})
  }
}

module "vm_da_assign" {
  source                         = "./modules/policy/assignment"
  policy_assignment_name         = "${var.mg_identification}-da-arc"
  policy_assignment_display_name = "${upper(var.mg_identification)} - ${var.vm_dependency_agent_policy_display_name}"
  policy_assignment_location     = var.location
  definition_id                  = azurerm_policy_set_definition.dependency_agent.id
  mg_id                          = data.azurerm_management_group.ccc.id
}

module "vm_da_rbac" {
  source                       = "./modules/rbac"
  rbac_assignment_scope        = data.azurerm_management_group.ccc.id
  rbac_def_id                  = "/providers/Microsoft.Authorization/roleDefinitions/b24988ac-6180-42a0-ab88-20f7382dd24c"
  rbac_assignment_principle_id = module.vm_da_assign.output_principle_id
}