terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>3.0"
    }
  }
}

provider "azurerm" {
  features {
  }
}

# Resource Group
resource "azurerm_resource_group" "demo_rg" {
  name     = "demo-terraform-rg"
  location = "East US"
}

# Storage Account
resource "azurerm_storage_account" "demo_storage" {
  name                     = "demostorageterraform123"
  resource_group_name      = azurerm_resource_group.demo_rg.name
  location                 = azurerm_resource_group.demo_rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  tags = {
    environment = "Training_Handson"
  }
}

