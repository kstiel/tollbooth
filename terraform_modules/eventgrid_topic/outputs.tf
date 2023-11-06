output "eventgridtopic_key" {
    value = "${azurerm_eventgrid_topic.tollbooth.primary_access_key}"
}

output "eventgridtopic_endpoint" {
    value = "${azurerm_eventgrid_topic.tollbooth.endpoint}"
}