resource "azurerm_storage_account" "storage" {
  name                     = var.storage_account_name
  resource_group_name      = "myResourceGroup"
  location                 = "East US"
  account_tier             = var.account_tier
  account_replication_type = var.account_replication_type
}
