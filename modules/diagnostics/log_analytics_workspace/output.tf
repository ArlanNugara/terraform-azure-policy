// Log Analytics Workspace Output

output "output_law_id" {
  value       = azurerm_log_analytics_workspace.law.id
  description = "Log Analytics Workspace ID"
}

output "output_law_workspace_id" {
  value       = azurerm_log_analytics_workspace.law.workspace_id
  description = "Log Analytics Workspace Workspace ID"
}

output "output_law_shared_key" {
  value       = azurerm_log_analytics_workspace.law.primary_shared_key
  description = "Log Analytics Workspace Primary Shared Key"
}