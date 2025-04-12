// AAD Join Extension

module "aad_join_gen" {
  source                  = "./modules/policy/definition"
  for_each                = local.gen_condition
  definition_name         = "${var.mg_identification}-${lower(each.key)}-gen-aad"
  definition_display_name = "${upper(var.mg_identification)} - Active Directory Join General ${each.key} VM"
  definition_mode         = "Indexed"
  mg_id                   = data.azurerm_management_group.ccc.id
  definition_metadata = jsonencode(
    {
      "category" : "Identity"
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
          "existenceCondition" : {
            "allOf" : [
              {
                "field" : "Microsoft.Compute/virtualMachines/extensions/type",
                "equals" : each.value.aad_login_type
              },
              {
                "field" : "Microsoft.Compute/virtualMachines/extensions/publisher",
                "equals" : each.value.aad_login_publisher
              },
              {
                "field" : "Microsoft.Compute/virtualMachines/extensions/provisioningState",
                "equals" : "Succeeded"
              }
            ]
          },
          "roleDefinitionIds" : [
            "/providers/microsoft.authorization/roleDefinitions/9980e02c-c2be-4d73-94e8-173b1dc7cf3c",
            "/providers/microsoft.authorization/roleDefinitions/1c0163c0-47e6-4577-8991-ea5c82e286e4"
          ],
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
                    "name" : "[concat(parameters('vmName'),'/${each.value.aad_login_name}')]",
                    "type" : "Microsoft.Compute/virtualMachines/extensions",
                    "location" : "[parameters('location')]",
                    "apiVersion" : "2017-12-01",
                    "properties" : {
                      "publisher" : each.value.aad_login_publisher,
                      "type" : each.value.aad_login_type,
                      "typeHandlerVersion" : each.value.aad_login_version,
                      "autoUpgradeMinorVersion" : true
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

module "aad_join_arc" {
  source                  = "./modules/policy/definition"
  for_each                = local.arc_condition
  definition_name         = "${var.mg_identification}-${lower(each.key)}-arc-aad"
  definition_display_name = "${upper(var.mg_identification)} - Active Directory Join ARC ${each.key} VM"
  definition_mode         = "Indexed"
  mg_id                   = data.azurerm_management_group.ccc.id
  definition_metadata = jsonencode(
    {
      "category" : "Identity"
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
          "type" : "Microsoft.HybridCompute/machines/extensions",
          "existenceCondition" : {
            "allOf" : [
              {
                "field" : "Microsoft.HybridCompute/machines/extensions/type",
                "equals" : each.value.aad_login_type
              },
              {
                "field" : "Microsoft.HybridCompute/machines/extensions/publisher",
                "equals" : each.value.aad_login_publisher
              },
              {
                "field" : "Microsoft.HybridCompute/machines/extensions/provisioningState",
                "equals" : "Succeeded"
              }
            ]
          },
          "roleDefinitionIds" : [
            "/providers/microsoft.authorization/roleDefinitions/9980e02c-c2be-4d73-94e8-173b1dc7cf3c"
          ],
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
                    "name" : "[concat(parameters('vmName'),'/${each.value.aad_login_name}')]",
                    "type" : "Microsoft.HybridCompute/machines/extensions",
                    "location" : "[parameters('location')]",
                    "apiVersion" : "2017-12-01",
                    "properties" : {
                      "publisher" : each.value.aad_login_publisher,
                      "type" : each.value.aad_login_type,
                      "typeHandlerVersion" : each.value.aad_login_version,
                      "autoUpgradeMinorVersion" : true
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

resource "azurerm_policy_set_definition" "aad_join" {
  name                = "${var.mg_identification}-aad-join-pol-set"
  display_name        = "${upper(var.mg_identification)} - VM AAD Join Set"
  policy_type         = "Custom"
  management_group_id = data.azurerm_management_group.ccc.id
  metadata = jsonencode(
    {
      "category" : "Identity"
    }
  )
  policy_definition_reference {
    policy_definition_id = module.aad_join_gen["Windows"].output_definition_id
    parameter_values     = jsonencode({})
  }
  policy_definition_reference {
    policy_definition_id = module.aad_join_gen["Linux"].output_definition_id
    parameter_values     = jsonencode({})
  }
  policy_definition_reference {
    policy_definition_id = module.aad_join_arc["Windows"].output_definition_id
    parameter_values     = jsonencode({})
  }
  policy_definition_reference {
    policy_definition_id = module.aad_join_arc["Linux"].output_definition_id
    parameter_values     = jsonencode({})
  }
}

module "vm_aad_assign" {
  source                         = "./modules/policy/assignment"
  policy_assignment_name         = "${var.mg_identification}-aad-join"
  policy_assignment_display_name = "${upper(var.mg_identification)} - ${var.vm_aad_join_policy_display_name}"
  policy_assignment_location     = var.location
  definition_id                  = azurerm_policy_set_definition.aad_join.id
  mg_id                          = data.azurerm_management_group.ccc.id
}

module "vm_aad_rbac" {
  source                       = "./modules/rbac"
  rbac_assignment_scope        = data.azurerm_management_group.ccc.id
  rbac_def_id                  = "/providers/Microsoft.Authorization/roleDefinitions/b24988ac-6180-42a0-ab88-20f7382dd24c"
  rbac_assignment_principle_id = module.vm_aad_assign.output_principle_id
}