resource "azurerm_management_group_policy_assignment" "policy-assignment" {
  name                 = "${var.org_prefix} Policy Initiative"
  policy_definition_id = azurerm_policy_set_definition.policy-set-definition.id
  management_group_id  = var.initiative_management_scope
  description          = "This policy enables a set of definitions that can be deployed."
  display_name         = "${var.org_prefix} Baseline Azure Policy Initiative"
  location             = "canadacentral"
  identity {
    type = "SystemAssigned"
  }
}