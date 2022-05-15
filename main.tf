resource "azurerm_management_group_policy_assignment" "policy-assignment" {
  name                 = "${var.client}-Policy Initiative"
  policy_definition_id = azurerm_policy_set_definition.policy-set-definition.id
  subscription_id      = var.subscription_id
  description          = "This policy enables a set of definitions that can be deployed."
  display_name         = "${var.client}-Baseline Azure Policy Initiative"
  location             = "canadacentral"
  identity {
    type = "SystemAssigned"
  }
}