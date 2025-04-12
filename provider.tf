terraform {
  required_version = "~> 1.10.2"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.1.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "3.6.3"
    }
  }

  backend "azurerm" {
    resource_group_name  = "Your value here"
    storage_account_name = "Your value here"
    container_name       = "Your value here"
    key                  = "Your value here"
  }
}

provider "azurerm" {
  features {}
}

provider "random" {}