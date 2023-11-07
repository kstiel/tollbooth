variable log_analytics_name {
    type = string
    description = "The name of log_analytics"
    default = "WorkspaceForFunctionApp"
}

variable app_insight_name {
    type = string
    description = "The name of the app insight"
}
variable location {
    type = string
    description = "Location of application insights"
}

variable resource_group_name {
    type = string
    description = "The name of the resource group"
}