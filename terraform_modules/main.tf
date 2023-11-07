terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.53.0"

    }
  }
}

provider "azurerm" {
  features {}
}

module "resource_group" {
  source    = "./resource_group"
  base_name = "Tollbooth"
  location  = var.location
}

module "init_storage" {
  source                    = "./init_storage"
  init_storage_account_name = "init"
  resource_group_name       = module.resource_group.resource_group_name
  location                  = var.location
  images_container_name     = "images"
  export_container_name     = var.init_storage_export_container_name
}

module "cosmosdb" {
  source                                   = "./cosmodb"
  resource_group_name                      = module.resource_group.resource_group_name
  location                                 = var.location
  cosmosdb_account_name                    = "initstorageaccount"
  cosmosdb_sql_database_name               = "Database"
  cosmosdb_sql_processed_container_name    = "Processed"
  cosmosdb_sql_manual_container_keypath    = "/licensePlateText"
  cosmosdb_sql_manual_container_name       = "NeedsManualReview"
  cosmosdb_sql_processed_container_keypath = "/filename"
}

module "events_function_app" {
  source                      = "./events_functionapp"
  resource_group_name         = module.resource_group.resource_group_name
  location                    = var.location
  events_storage_account_name = "events"
  events_service_plan_name    = "EventsServicePlan"
  events_function_app_name    = "EventsFunctionApp"
}

module "app_function_app" {
  source                   = "./app_functionapp"
  resource_group_name      = module.resource_group.resource_group_name
  location                 = var.location
  app_storage_account_name = "app"
  app_service_plan_name    = "AppServicePlan"
  app_function_app_name    = "AppFunctionApp"

  computervision_api_url          = format("%s%s", module.computer_vision.computerVisionEndPoint, "vision/v2.0/ocr")
  computervision_apikey_keyvault  = format("@Microsoft.KeyVault(VaultName=%s;SecretName=%s)", "${var.key_vault_name}", "${var.computervision_apikey_name}")
  eventgridtopic_endpoint         = module.eventgrid_topic.eventgridtopic_endpoint
  eventgridtopic_key              = format("@Microsoft.KeyVault(VaultName=%s;SecretName=%s)", "${var.key_vault_name}", "${var.eventgridtopic_key_name}")
  cosmosdb_endpoint               = module.cosmosdb.cosmosdb_endpoint
  cosmosdb_authorizationkey       = format("@Microsoft.KeyVault(VaultName=%s;SecretName=%s)", "${var.key_vault_name}", "${var.cosmosdb_authoricationkey_name}")
  cosmosdb_database_id            = module.cosmosdb.cosmosdb_database_id
  cosmosdb_processed_container_id = module.cosmosdb.cosmosdb_processed_container_id
  init_export_container_name      = var.init_storage_export_container_name
  blobstorage_connection          = format("@Microsoft.KeyVault(VaultName=%s;SecretName=%s)", "${var.key_vault_name}", "${var.init_storage_authorizationkey_name}")
}

module "key_vault" {
  source              = "./key_vault"
  key_vault_name      = var.key_vault_name
  resource_group_name = module.resource_group.resource_group_name
  location            = var.location
  tenant_id           = data.azurerm_client_config.current.tenant_id
  object_id           = data.azurerm_client_config.current.object_id
  app_object_id       = module.app_function_app.app_object_id
}

module "secrets" {
  source                         = "./secrets"
  key_vault_id                   = module.key_vault.key_vault_id
  cosmosdb_authorizationkey_name = var.cosmosdb_authoricationkey_name
  cosmosdb_authorizationkey      = module.cosmosdb.authorizationkey
  init_storageconnectionkey_name = var.init_storage_authorizationkey_name
  init_storageconnectionkey      = module.init_storage.storageconnectionkey
  computervision_apikey_name     = var.computervision_apikey_name
  computervision_apikey          = module.computer_vision.computerVisionApiKey
  eventgridtopic_key_name        = var.eventgridtopic_key_name
  eventgridtopic_key             = module.eventgrid_topic.eventgridtopic_key
}

module "eventgrid_topic" {
  source               = "./eventgrid_topic"
  eventgrid_topic_name = "TollboothEventGridTopic"
  resource_group_name  = module.resource_group.resource_group_name
  location             = var.location

  # processimage_function_name      = "ProcessImage"
  # app_function_id                 = module.app_function_app.app_id
  # app_function_storage_account_id = module.app_function_app.app_storage_account_id

}


module "computer_vision" {
  source                 = "./computer_vision"
  cognitive_account_name = "TollboothComputerVision"
  resource_group_name    = module.resource_group.resource_group_name
  location               = var.location
}



