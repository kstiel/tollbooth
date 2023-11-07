resource "azurerm_eventgrid_topic" "tollbooth" {
  name                = "${var.eventgrid_topic_name}"
  location            = "${var.location}"
  resource_group_name = "${var.resource_group_name}"
}

