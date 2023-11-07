variable "app_storage_account_name" {
  type = string
  description = "The name of app storage account"
}

variable "resource_group_name" {
    type = string
    description = "The name of the resource group that the app storage account is in"
}

variable "location" {
    type = string
    description = "The location of the strogate account"
}

variable "app_service_plan_name" {
  type = string
  description = "The name of service plan for this function app"
}

variable "app_function_app_name" {
  type = string
  description = "The name of service plan for this function app"
}

variable "application_insights_key" {
  type = string
  description = "The app insight key for this function"
}

variable "computervision_api_url" {
  type = string
  description = "Computer vision endpoint url"
}

variable "computervision_apikey_keyvault" {
  type = string
  description = "Computer API key from key vault"
}

variable "eventgridtopic_endpoint" {
  type = string
}

variable "eventgridtopic_key" {
  type = string
}

variable "cosmosdb_endpoint" {
  type = string
}

variable "cosmosdb_authorizationkey" {
  type = string
}

variable "cosmosdb_database_id" {
  type = string
}

variable "cosmosdb_processed_container_id" {
  type = string
}

variable "init_export_container_name" {
  type = string
}

variable "blobstorage_connection" {
  type = string
}