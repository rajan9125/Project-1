

resource "azurerm_key_vault" "key-valt-name" {
  name                        = var.key-valt-name
  location                    = var.location
  resource_group_name         = var.rg-name
  enabled_for_disk_encryption = var.enabled_for_disk_encryption
  tenant_id                   = var.tenant_id
  soft_delete_retention_days  = var.soft_delete_retention_days
  purge_protection_enabled    = var.purge_protection_enabled

  sku_name = var.key-sku-name
 access_policy {
    tenant_id = var.tenant_id
    object_id = var.object_id

    key_permissions = [
      "Get",
    ]

    secret_permissions = [
      "Get",
      "Set",
    ]
    

    storage_permissions = [
      "Get",
    ]
  }

}
data "azurerm_client_config" "current" {}

output "key_vault_id" {
  value = azurerm_key_vault.key-valt-name.id
}