output "resourcegroup_id" {
  value = azurerm_resource_group.demo_rg.id
}

output "storageaccount" {
  value = azurerm_storage_account.demo_storage.tags
  
}