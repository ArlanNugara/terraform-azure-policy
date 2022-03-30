terraform {
  required_version = "~> 1.1.0"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "2.98.0"
    }
  }

  backend "azurerm" {
    resource_group_name  = "<Your Value Here>"
    storage_account_name = "<Your Value Here>"
    container_name       = "<Your Value Here>"
    key                  = "<Your Value Here>"
  }
}

provider "azurerm" {
  features {}
}
