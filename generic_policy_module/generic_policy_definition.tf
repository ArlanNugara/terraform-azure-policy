resource "azurerm_policy_definition" "policy" {
  name                = var.policy_definition_name
  display_name        = var.policy_definition_display_name
  description         = var.policy_definition_description
  policy_type         = "Custom"
  mode                = "All"
  management_group_id = var.policy_management_scope
  metadata            = var.policy_definition_metadata
  policy_rule         = var.policy_definition_rule
  parameters          = var.policy_definition_parameters
}