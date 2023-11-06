resource "azurerm_resource_group" "tollbooth" {
  name     = "${var.base_name}-resource-group"
  location = "${var.location}"
}