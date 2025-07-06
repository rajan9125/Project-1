
resource "azurerm_key_vault_secret" "key-secret" {
  name         = var.key-user-name
  value        = var.key-user-value
  key_vault_id = var.key-vault-user-id
}

output "key_vault_secret_id" {
  value = azurerm_key_vault_secret.key-secret.id
}
output "key_vault_secret_value" {
  value = azurerm_key_vault_secret.key-secret.value
}