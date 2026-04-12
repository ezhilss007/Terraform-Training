# Resource Group
resource "azurerm_resource_group" "demo_rg" {
  name     = var.resourcegroup_name
  location = var.location
}

# Storage Account
resource "azurerm_storage_account" "demo_storage" {
  name                     = var.storageaccount_name
  resource_group_name      = var.resourcegroup_name
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  tags = {
    environment = "Training_Handson"
  }
}
