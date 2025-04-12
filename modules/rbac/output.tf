// RBAC Assignment Output

output "output_rbac_assignment_id" {
  value       = azurerm_role_assignment.rbac_assignment.id
  description = "RBAC Assignment ID"
}