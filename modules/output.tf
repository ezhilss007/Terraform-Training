output "rg_names" {
  value = { for k, v in module.rg : k => v.name }
}

output "vm_names" {
  value = module.vm[*].name
}

output "primary_blob_endpoint" {
  value = azurerm_storage_account.storage.primary_blob_endpoint
}