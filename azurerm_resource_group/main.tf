resource "azurerm_resource_group" "rg" {
  name     = "rajansrg1"
  location = "east us"
}

resource "azurerm_storage_account" "rgst" {
  name                     = "rgst123"
  resource_group_name      = "rajansrg1"
  location                 = "east us"
  account_tier             = "Premium"
  account_replication_type = "GRS"

}
