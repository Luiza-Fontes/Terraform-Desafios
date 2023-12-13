resource "azurerm_storage_account" "sa" {
  count                    = var.cria-rg ? 1 : 0
  name                     = "satfestudosconsditions"
  resource_group_name      = azurerm_resource_group.rg-tf-conditions.name
  location                 = azurerm_resource_group.rg-tf-conditions.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  depends_on = [
    azurerm_resource_group.rg-tf-conditions
  ]
}