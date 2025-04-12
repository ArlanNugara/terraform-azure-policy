// Data

data "azurerm_management_group" "ccc" {
  name = var.mg_id
}

data "azurerm_client_config" "me" {}

resource "random_string" "deployment_name" {
  length  = 10
  special = false
  keepers = {
    name = "dcr-${var.mg_identification}-change-001"
  }
}