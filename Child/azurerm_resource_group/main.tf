resource "azurerm_resource_group" "rg_name" {
  name = var.resour_group_name
  location = var.resource_group_location
}