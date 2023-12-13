resource "azurerm_storage_account" "sa" {
  name                     = data.azurerm_key_vault_secret.sa.value
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  depends_on = [
    azurerm_resource_group.rg
  ]
}