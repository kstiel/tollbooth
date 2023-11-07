resource "azurerm_log_analytics_workspace" "function_app_log_analytics" {
    name = "${var.log_analytics_name}"
    resource_group_name = "${var.resource_group_name}"
    location = "${var.location}"
}

resource "azurerm_application_insights" "function_app_insights" {
  name                = "${var.app_insight_name}"
  location            = "${var.location}"
  resource_group_name = "${var.resource_group_name}"
  workspace_id        = azurerm_log_analytics_workspace.function_app_log_analytics.id
  application_type    = "web"
}

