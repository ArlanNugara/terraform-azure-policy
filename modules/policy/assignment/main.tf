// Azure Policy Assignment

resource "azurerm_management_group_policy_assignment" "policy_assignment" {
  name                 = var.policy_assignment_name
  display_name         = var.policy_assignment_display_name
  policy_definition_id = var.definition_id
  management_group_id  = var.mg_id
  enforce              = true
  location             = var.policy_assignment_location
  parameters           = var.policy_assignment_param
  identity {
    type = "SystemAssigned"
  }
  # lifecycle {
  #   ignore_changes = [
  #     parameters
  #   ]
  # }
}