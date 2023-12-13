output "rg" {
  value = azurerm_resource_group.rg
}


output "account_id" {
  value = data.azurerm_client_config.current.client_id
}