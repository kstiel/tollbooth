output app_insight_instrumentation_key {
    value = "${azurerm_application_insights.function_app_insights.instrumentation_key}"
}

output app_id {
    value = "${azurerm_application_insights.function_app_insights.id}"
}