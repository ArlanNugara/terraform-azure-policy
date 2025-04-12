// Log Analytics Workspace

terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
    }
  }
}

resource "azurerm_log_analytics_workspace" "law" {
  name                = var.law_name
  location            = var.law_location
  resource_group_name = var.law_rg_name
  sku                 = var.law_sku
  retention_in_days   = var.law_retension_days
  daily_quota_gb      = var.law_daily_quota
  tags = merge(
    {
      Type = "Log Analytics Workspace"
    },
    var.default_tags
  )
  lifecycle {
    ignore_changes = [
      tags
    ]
  }
}