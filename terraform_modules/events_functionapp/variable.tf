variable "events_storage_account_name" {
  type = string
  description = "The name of events storage account"
}

variable "resource_group_name" {
    type = string
    description = "The name of the resource group that the events storage account is in"
}

variable "location" {
    type = string
    description = "The location of the strogate account"
}

variable "events_service_plan_name" {
  type = string
  description = "The name of service plan for this function app"
}

variable "application_insights_key" {
  type = string
  description = "The application insights key for this function app"
}

variable "events_function_app_name" {
  type = string
  description = "The name of service plan for this function app"
}