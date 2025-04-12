// Shared Resources

resource "azurerm_resource_group" "mgmt_rg" {
  name     = "rg-${var.mg_identification}-shared-${var.location}-001"
  location = var.location
  tags = merge(
    {
      Type = "Resource Group"
    },
    var.default_tags
  )
  lifecycle {
    ignore_changes = [
      tags
    ]
  }
}

module "law" {
  source       = "./modules/diagnostics/log_analytics_workspace"
  law_name     = "log-${var.mg_identification}-central-001"
  law_rg_name  = azurerm_resource_group.mgmt_rg.name
  law_location = var.location
  default_tags = var.default_tags
  # providers = {
  #   azurerm = azurerm.management
  # }
}

resource "azurerm_monitor_data_collection_endpoint" "vm_dce" {
  name                = "dce-${var.mg_identification}-central-001"
  resource_group_name = azurerm_resource_group.mgmt_rg.name
  location            = azurerm_resource_group.mgmt_rg.location
  tags = merge(
    {
      Type = "Data Collection Endpoint"
    },
    var.default_tags
  )
  # provider = azurerm.management
  lifecycle {
    ignore_changes = [
      tags
    ]
  }
}