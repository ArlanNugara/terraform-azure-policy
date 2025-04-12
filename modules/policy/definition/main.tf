// Azure Policy Definition

resource "azurerm_policy_definition" "definition" {
  name                = var.definition_name
  policy_type         = "Custom"
  mode                = var.definition_mode
  display_name        = var.definition_display_name
  metadata            = var.definition_metadata
  policy_rule         = var.definition_policy_rule
  parameters          = var.definition_parameters
  management_group_id = var.mg_id
  # lifecycle {
  #   ignore_changes = [
  #     policy_rule
  #   ]
  # }
}