data "azurerm_mssql_server" "ms_sql_server_id" {
  name                = var.sql_server_name
  resource_group_name = var.resource_group_name
}

resource "azurerm_mssql_database" "sql_db" {
  name         = var.sql_db_name
  server_id    = data.azurerm_mssql_server.ms_sql_server_id.id
  collation    = var.collation
  license_type = var.license_type
  max_size_gb  = var.max_size_gb
  sku_name     = var.sku_name
}
