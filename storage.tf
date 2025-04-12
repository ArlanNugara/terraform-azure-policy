// Storage Policy

resource "azurerm_policy_set_definition" "stor" {
  name                = "${var.mg_identification}-stor-pol-set"
  display_name        = "${upper(var.mg_identification)} - Storage Governance Set"
  policy_type         = "Custom"
  management_group_id = data.azurerm_management_group.ccc.id
  metadata = jsonencode(
    {
      "category" : "Storage"
    }
  )
  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/7433c107-6db4-4ad1-b57a-a76dce0154a1"
    parameter_values = jsonencode(
      {
        "effect" : {
          "type" : "String",
          "metadata" : {
            "displayName" : "Policy Effect",
            "description" : "The desired effect of the policy."
          },
          "value" : var.stor_allowed_sku_effect
        },
        "listOfAllowedSKUs" : {
          "type" : "Array",
          "metadata" : {
            "description" : "The list of SKUs that can be specified for storage accounts.",
            "displayName" : "Allowed SKUs",
            "strongType" : "StorageSKUs"
          },
          "value" : var.stor_allowed_sku
        }
      }
    )
  }
  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/404c3081-a854-4457-ae30-26a93ef643f9"
    parameter_values     = jsonencode({})
  }
  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/b2982f36-99f2-4db5-8eff-283140c09693"
    parameter_values     = jsonencode({})
  }
  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/044985bb-afe1-42cd-8a36-9d5d42424537"
    parameter_values     = jsonencode({})
  }
  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/fe83a0eb-a853-422d-aac2-1bffd182c5d0"
    parameter_values     = jsonencode({})
  }
}

module "stor_pol" {
  source                         = "./modules/policy/assignment"
  policy_assignment_name         = "${var.mg_identification}-stor-pol"
  policy_assignment_display_name = "${upper(var.mg_identification)} - ${var.stor_policy_display_name}"
  definition_id                  = azurerm_policy_set_definition.stor.id
  policy_assignment_location     = var.location
  mg_id                          = data.azurerm_management_group.ccc.id
}

module "stor_rbac" {
  source                       = "./modules/rbac"
  rbac_assignment_scope        = data.azurerm_management_group.ccc.id
  rbac_def_id                  = "/providers/Microsoft.Authorization/roleDefinitions/b24988ac-6180-42a0-ab88-20f7382dd24c"
  rbac_assignment_principle_id = module.stor_pol.output_principle_id
}