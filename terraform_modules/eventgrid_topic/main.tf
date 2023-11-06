resource "azurerm_eventgrid_topic" "tollbooth" {
  name                = "${var.eventgrid_topic_name}"
  location            = "${var.location}"
  resource_group_name = "${var.resource_group_name}"
}

resource "azurerm_eventgrid_event_subscription" "processimage" {
  name = "ProcessImage"
  scope = var.app_function_storage_account_id

  included_event_types = ["Microsoft.Storage.BlobCreated"]
  azure_function_endpoint {
    function_id = "${var.app_function_id}/functions/${var.processimage_function_name}"
  }
}

