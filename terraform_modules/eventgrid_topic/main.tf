resource "azurerm_eventgrid_topic" "tollbooth" {
  name                = "${var.eventgrid_topic_name}"
  location            = "${var.location}"
  resource_group_name = "${var.resource_group_name}"
}

resource "azurerm_eventgrid_event_subscription" "savePlateData" {
  name = "savePlateData"
  scope = azurerm_eventgrid_topic.tollbooth.id

  included_event_types = ["savePlateData"]
  azure_function_endpoint {
    function_id = "${var.savePlateData_function_id}"
  }
}

resource "azurerm_eventgrid_event_subscription" "QueuePlateForManualCheckup" {
  name = "QueuePlateForManualCheckup"
  scope = azurerm_eventgrid_topic.tollbooth.id

  included_event_types = ["queuePlateForManualCheckup"]
  azure_function_endpoint {
    function_id = "${var.checkup_function_id}"
  }
}