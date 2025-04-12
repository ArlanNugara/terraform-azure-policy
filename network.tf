// Network Policy

module "net_allowed_vnet_pip" {
  source                  = "./modules/policy/definition"
  definition_name         = "${var.mg_identification}-net-all-snet-pip"
  definition_display_name = "${upper(var.mg_identification)} - Allowed Subnet for Public IP"
  definition_mode         = "Indexed"
  mg_id                   = data.azurerm_management_group.ccc.id
  definition_metadata = jsonencode(
    {
      "category" : "Network"
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
          "deny",
          "Deny",
          "Audit",
          "audit"
        ]
      },
      "listOfVnet" : {
        "type" : "Array",
        "metadata" : {
          "description" : "The list of VNET allowed for Public IP.",
          "displayName" : "Public Virtual Network"
        }
      }
    }
  )
  definition_policy_rule = jsonencode(
    {
      "if" : {
        "allOf" : [
          {
            "field" : "type",
            "equals" : "Microsoft.Network/networkInterfaces"
          },
          {
            "not" : {
              "field" : "Microsoft.Network/networkInterfaces/ipconfigurations[*].publicIpAddress.id",
              "notLike" : "*"
            }
          },
          {
            "field" : "Microsoft.Network/networkInterfaces/ipconfigurations[*].subnet.id",
            "in" : "[parameters('listOfVnet')]"
          }
        ]
      },
      "then" : {
        "effect" : "[parameters('effect')]"
      }
    }
  )
}

resource "azurerm_policy_set_definition" "net" {
  name                = "${var.mg_identification}-net-pol-set"
  display_name        = "${upper(var.mg_identification)} - Network Governance Set"
  management_group_id = data.azurerm_management_group.ccc.id
  policy_type         = "Custom"
  metadata = jsonencode(
    {
      "category" : "Network"
    }
  )
  policy_definition_reference {
    policy_definition_id = module.net_allowed_vnet_pip.output_definition_id
    parameter_values = jsonencode(
      {
        "effect" : {
          "type" : "String",
          "metadata" : {
            "displayName" : "Effect",
            "description" : "Enable or disable the execution of the policy"
          },
          "value" : var.net_allowed_vnet_pip_effect
        },
        "listOfVnet" : {
          "type" : "Array",
          "metadata" : {
            "description" : "The list of VNET allowed for Public IP.",
            "displayName" : "Public Virtual Network"
          },
          "value" : var.net_allowed_vnet_pip
        }
      }
    )
  }
  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/c251913d-7d24-4958-af87-478ed3b9ba41"
    parameter_values     = jsonencode({})
  }
  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/4c3c6c5f-0d47-4402-99b8-aa543dd8bcee"
    parameter_values     = jsonencode({})
  }
  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/e71308d3-144b-4262-b144-efdc3cc90517"
    parameter_values     = jsonencode({})
  }
  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/f6de0be7-9a8a-4b8a-b349-43cf02d22f7c"
    parameter_values     = jsonencode({})
  }
  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/bb91dfba-c30d-4263-9add-9c2384e659a6"
    parameter_values     = jsonencode({})
  }
  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/9daedab3-fb2d-461e-b861-71790eead4f6"
    parameter_values     = jsonencode({})
  }
  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/fc5e4038-4584-4632-8c85-c0448d374b2c"
    parameter_values     = jsonencode({})
  }
  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/564feb30-bf6a-4854-b4bb-0d2d2d1e6c66"
    parameter_values     = jsonencode({})
  }
}

module "net_pol" {
  source                         = "./modules/policy/assignment"
  policy_assignment_name         = "${var.mg_identification}-net-pol"
  policy_assignment_display_name = "${upper(var.mg_identification)} - ${var.net_policy_display_name}"
  definition_id                  = azurerm_policy_set_definition.net.id
  policy_assignment_location     = var.location
  mg_id                          = data.azurerm_management_group.ccc.id
}

module "net_rbac" {
  source                       = "./modules/rbac"
  rbac_assignment_scope        = data.azurerm_management_group.ccc.id
  rbac_def_id                  = "/providers/Microsoft.Authorization/roleDefinitions/b24988ac-6180-42a0-ab88-20f7382dd24c"
  rbac_assignment_principle_id = module.net_pol.output_principle_id
}