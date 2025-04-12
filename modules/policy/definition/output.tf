// Azure Policy Definition Output

output "output_definition_id" {
  value       = azurerm_policy_definition.definition.id
  description = "Policy Definition ID"
}

output "output_definition_name" {
  value       = azurerm_policy_definition.definition.name
  description = "Policy Definition Name"
}