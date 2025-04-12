// General Policy

module "gen_allowed_loc" {
  source                  = "./modules/policy/definition"
  definition_name         = "${var.mg_identification}-gen-all-loc"
  definition_display_name = "${upper(var.mg_identification)} - Allowed Location"
  definition_mode         = "Indexed"
  mg_id                   = data.azurerm_management_group.ccc.id
  definition_metadata = jsonencode(
    {
      "category" : "Governance"
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
      "listOfAllowedLocations" : {
        "type" : "Array",
        "metadata" : {
          "description" : "The list of locations that can be specified when deploying resources.",
          "strongType" : "location",
          "displayName" : "Allowed locations"
        }
      }
    }
  )
  definition_policy_rule = jsonencode(
    {
      "if" : {
        "allOf" : [
          {
            "field" : "location",
            "notIn" : "[parameters('listOfAllowedLocations')]"
          },
          {
            "field" : "location",
            "notEquals" : "global"
          },
          {
            "field" : "type",
            "notEquals" : "Microsoft.AzureActiveDirectory/b2cDirectories"
          }
        ]
      },
      "then" : {
        "effect" : "[parameters('effect')]"
      }
    }
  )
}

module "gen_allowed_res" {
  source                  = "./modules/policy/definition"
  definition_name         = "${var.mg_identification}-gen-all-res"
  definition_display_name = "${upper(var.mg_identification)} - Allowed Resource Type"
  definition_mode         = "All"
  mg_id                   = data.azurerm_management_group.ccc.id
  definition_metadata = jsonencode(
    {
      "category" : "Governance"
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
      "listOfAllowedResources" : {
        "type" : "Array",
        "metadata" : {
          "description" : "The list of resource types that can be deployed.",
          "displayName" : "Allowed resource types",
          "strongType" : "resourceTypes"
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
            "in" : "[parameters('listOfAllowedResources')]"
          }
        ]
      },
      "then" : {
        "effect" : "[parameters('effect')]"
      }
    }
  )
}

resource "azurerm_policy_set_definition" "gen" {
  name                = "${var.mg_identification}-gen-pol-set"
  display_name        = "${upper(var.mg_identification)} - General Governance Set"
  management_group_id = data.azurerm_management_group.ccc.id
  policy_type         = "Custom"
  metadata = jsonencode(
    {
      "category" : "Governance"
    }
  )
  policy_definition_reference {
    policy_definition_id = module.gen_allowed_loc.output_definition_id
    parameter_values = jsonencode(
      {
        "effect" : {
          "type" : "String",
          "metadata" : {
            "displayName" : "Effect",
            "description" : "Enable or disable the execution of the policy"
          },
          "value" : var.gen_allowed_loc_effect
        },
        "listOfAllowedLocations" : {
          "type" : "Array",
          "metadata" : {
            "description" : "The list of locations that can be specified when deploying resources.",
            "strongType" : "location",
            "displayName" : "Allowed locations"
          },
          "value" : var.gen_allowed_loc
        }
      }
    )
  }
  policy_definition_reference {
    policy_definition_id = module.gen_allowed_res.output_definition_id
    parameter_values = jsonencode(
      {
        "effect" : {
          "type" : "String",
          "metadata" : {
            "displayName" : "Effect",
            "description" : "Enable or disable the execution of the policy"
          },
          "value" : var.gen_allowed_res_effect
        },
        "listOfAllowedResources" : {
          "type" : "Array",
          "metadata" : {
            "description" : "The list of resource types that can be deployed.",
            "displayName" : "Allowed resource types",
            "strongType" : "resourceTypes"
          },
          "value" : var.gen_allowed_res
        }
      }
    )
  }
}

module "gen_pol" {
  source                         = "./modules/policy/assignment"
  policy_assignment_name         = "${var.mg_identification}-gen-pol"
  policy_assignment_display_name = "${upper(var.mg_identification)} - ${var.gen_policy_display_name}"
  policy_assignment_location     = var.location
  definition_id                  = azurerm_policy_set_definition.gen.id
  mg_id                          = data.azurerm_management_group.ccc.id
}

module "gen_rbac" {
  source                       = "./modules/rbac"
  rbac_assignment_scope        = data.azurerm_management_group.ccc.id
  rbac_def_id                  = "/providers/Microsoft.Authorization/roleDefinitions/b24988ac-6180-42a0-ab88-20f7382dd24c"
  rbac_assignment_principle_id = module.gen_pol.output_principle_id
}