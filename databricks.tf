// Databricks Policy

resource "azurerm_policy_set_definition" "dbw" {
  name                = "${var.mg_identification}-dbw-pol-set"
  display_name        = "${upper(var.mg_identification)} - Databricks Governance Set"
  policy_type         = "Custom"
  management_group_id = data.azurerm_management_group.ccc.id
  metadata = jsonencode(
    {
      "category" : "Analytics"
    }
  )
  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/0e7849de-b939-4c50-ab48-fc6b0f5eeba2"
    parameter_values     = jsonencode({})
  }
  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/138ff14d-b687-4faa-a81c-898c91a87fa2"
    parameter_values = jsonencode(
      {
        "requiredRetentionDays" : {
          "type" : "String",
          "metadata" : {
            "displayName" : "Required retention (days)",
            "description" : "The required resource logs retention in days if exporting to an Azure Storage account"
          },
          "value" : var.dbw_log_retension_days
        }
      }
    )
  }
  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/9c25c9e4-ee12-4882-afd2-11fb9d87893f"
    parameter_values     = jsonencode({})
  }
  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/51c1490f-3319-459c-bbbc-7f391bbed753"
    parameter_values     = jsonencode({})
  }
}

module "dbw_pol" {
  source                         = "./modules/policy/assignment"
  policy_assignment_name         = "${var.mg_identification}-dbw-pol"
  policy_assignment_display_name = "${upper(var.mg_identification)} - ${var.dbw_policy_display_name}"
  definition_id                  = azurerm_policy_set_definition.dbw.id
  policy_assignment_location     = var.location
  mg_id                          = data.azurerm_management_group.ccc.id
}

module "dbw_rbac" {
  source                       = "./modules/rbac"
  rbac_assignment_scope        = data.azurerm_management_group.ccc.id
  rbac_def_id                  = "/providers/Microsoft.Authorization/roleDefinitions/b24988ac-6180-42a0-ab88-20f7382dd24c"
  rbac_assignment_principle_id = module.dbw_pol.output_principle_id
}