
resource "azurerm_mssql_server" "sql-server-name" {

  name                         = var.sql_server_name
  resource_group_name          = var.resource_group_name
  location                     = var.sql_server_location
  version                      = var.sql_server_version
  administrator_login          = var.administrator_login
  administrator_login_password = var.administrator_login_password
}
resource "azurerm_mssql_firewall_rule" "example" {
  name             = "FirewallRule1"
  server_id        = azurerm_mssql_server.sql-server-name.id
  start_ip_address = "10.0.17.62"
  end_ip_address   = "10.0.17.62"
}
variable "administrator_login" {

}

variable "administrator_login_password" {
  
}