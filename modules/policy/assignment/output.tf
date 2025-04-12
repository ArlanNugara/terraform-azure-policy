// Azure Policy Assignment Output

output "output_policy_assignment_id" {
  value       = azurerm_management_group_policy_assignment.policy_assignment.id
  description = "Policy Assignment ID"
}

output "output_policy_assignment_name" {
  value       = azurerm_management_group_policy_assignment.policy_assignment.name
  description = "Policy Assignment Name"
}

output "output_principle_id" {
  value       = azurerm_management_group_policy_assignment.policy_assignment.identity[0].principal_id
  description = "Policy Assignment Principle ID"
}