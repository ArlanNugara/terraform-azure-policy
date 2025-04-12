// RBAC Assignment

resource "azurerm_role_assignment" "rbac_assignment" {
  scope              = var.rbac_assignment_scope
  role_definition_id = var.rbac_def_id
  principal_id       = var.rbac_assignment_principle_id
}