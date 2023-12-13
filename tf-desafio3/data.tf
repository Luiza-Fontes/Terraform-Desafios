data "azurerm_client_config" "current" {}

data "azurerm_key_vault_secret" "sa" {
  name         = var.secret-sa1
  key_vault_id = azurerm_key_vault.kvault.id

  depends_on = [
    azurerm_key_vault_secret.sa
  ]
}