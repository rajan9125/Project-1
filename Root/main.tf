module "azurerm_resource_group" {
  source = "../Child/azurerm_resource_group"

  resour_group_name       = "project-9125-sqlserver"
  resource_group_location = "East US"

}
module "azurerm_resource_group" {
  source = "../Child/azurerm_resource_group"

  resour_group_name       = "project-9125-sqlserver1"
  resource_group_location = "East US"

}
module "azurerm_resource_group" {
  source = "../Child/azurerm_resource_group"

  resour_group_name       = "project-9126-sqlserver1"
  resource_group_location = "East US"

}

module "azurerm_resource_group" {
  source = "../Child/azurerm_resource_group"

  resour_group_name       = "project-9127-sqlserver1"
  resource_group_location = "East US"

}


module "azurerm_mssql_server" {

  depends_on = [ module.azurerm_resource_group,module.azurerm_key_vault_secret,module.azurerm_key_vault_secret2 ]
  source                       = "../Child/azurerm_sql_server"
  sql_server_name              = "rajan9125291955"
  resource_group_name          = "project-9125-sqlserver"
  sql_server_location          = "centralindia"
  administrator_login          = module.azurerm_key_vault_secret.key_vault_secret_value
  administrator_login_password = module.azurerm_key_vault_secret2.key_vault_secret_value

  sql_server_version = "12.0"
}

module "azurerm_mssql_database" {

  depends_on = [module.azurerm_mssql_server]
  source     = "../Child/azurerm_sql_database"

  sql_db_name         = "ms-sql-db"
  collation           = "SQL_Latin1_General_CP1_CI_AS"
  max_size_gb         = 2
  sku_name            = "S0"
  license_type        = "LicenseIncluded"
  resource_group_name = "project-9125-sqlserver"
  sql_server_name     = "rajan9125291955"

}

module "key-valt" {
  depends_on = [ module.azurerm_resource_group ]
  source = "../Child/azurerm_key_vault"
  key-valt-name = "rajan-key"
  location = "centralindia"
  rg-name = "project-9125-sqlserver"
  enabled_for_disk_encryption = "true"
  tenant_id = data.azurerm_client_config.current.tenant_id
  object_id = data.azurerm_client_config.current.object_id
  soft_delete_retention_days = 30
  purge_protection_enabled = false
  key-sku-name = "standard"
}
data "azurerm_client_config" "current" {
  
}

module "azurerm_key_vault_secret" {
  depends_on = [ module.key-valt ]
  source = "../Child/azurerm_key_vault_secet"
  key-user-name = "sqlserver-id"
  key-user-value = "adminuser"
  key-vault-user-id = module.key-valt.key_vault_id

}
module "azurerm_key_vault_secret2" {
  depends_on = [ module.key-valt ]
  source = "../Child/azurerm_key_vault_secet"
  key-user-name = "sqlserver-password"
  key-user-value = "Rajan@9125291955"
  key-vault-user-id = module.key-valt.key_vault_id

}