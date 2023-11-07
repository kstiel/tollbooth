terraform {
  required_providers {
    random = {
      source = "hashicorp/random"
      version = "3.5.1"
    }
  }
}

resource "random_string" "sixrandom" {
  length           = 6
  special          = false
  upper = false
}

# Creating the Azure Storage Account for tollbooth app
resource "azurerm_storage_account" "app" {
  name                     = "${lower(var.app_storage_account_name)}${random_string.sixrandom.result}"
  resource_group_name      = "${var.resource_group_name}"
  location                 = "${var.location}"
  account_tier             = "Standard"
  account_replication_type = "RAGRS"
}

resource "azurerm_service_plan" "app" {
  name                = "${var.app_service_plan_name}"
  resource_group_name = "${var.resource_group_name}"
  location            = "${var.location}"
  os_type             = "Linux"
  sku_name            = "S1"
}

resource "random_string" "threerandom" {
  length           = 3
  special          = false
  upper = false
}

resource "azurerm_linux_function_app" "app" {
  name                = "${var.app_function_app_name}${random_string.threerandom.result}"
  resource_group_name = "${var.resource_group_name}"
  location            = "${var.location}"
  storage_account_name       = azurerm_storage_account.app.name
  storage_account_access_key = azurerm_storage_account.app.primary_access_key
  service_plan_id            = azurerm_service_plan.app.id

  site_config {
    application_stack {
      dotnet_version = "6.0"
    }
  }

  identity {
    type = "SystemAssigned"
  }

  app_settings = {
    "computerVisionApiUrl" = "${var.computervision_api_url}"
    "computerVisionApiKey" = "${var.computervision_apikey_keyvault}"
    "eventGridTopicEndpoint" = "${var.eventgridtopic_endpoint}"
    "eventGridTopicKey" = "${var.eventgridtopic_key}"
    "cosmosDBEndPointUrl" = "${var.cosmosdb_endpoint}"
    "cosmosDBAuthorizationKey" = "${var.cosmosdb_authorizationkey}"
    "cosmosDBDatabaseId" = "${var.cosmosdb_database_id}"
    "cosmosDBCollectionId" = "${var.cosmosdb_processed_container_id}"
    "exportCsvContainerName" = "${var.init_export_container_name}"
    "blobStorageConnection" = "${var.blobstorage_connection}"


    # "computerVisionApiUrl" = format("%s%s", "${var.computerVisionApiUrl}", "vision/v2.0/ocr")
    # "computerVisionApiKey" = "@Microsoft.KeyVault(SecretUri=${azurerm_key_vault.tollbooth_key_vault}secrets/${azurerm_key_vault_secret.computerVisionApiKey.name}/${azurerm_key_vault_secret.computerVisionApiKey.version})"
    # "eventGridTopicEndpoint" = data.azurerm_eventgrid_topic.tollbooth_eventgrid_topic.endpoint
    # "cosmosDBEndPointUrl" = data.azurerm_cosmosdb_account.db.endpoint
    # "cosmosDBDatabaseId" = azurerm_cosmosdb_sql_database.sql.id
    # "cosmosDBCollectionId" = azurerm_cosmosdb_sql_container.processed_container.id
    # "exportCsvContainerName" = azurerm_storage_container.export.name
  }
}


resource "azurerm_eventgrid_event_subscription" "processimage" {
  name = "ProcessImage"
  scope = azurerm_storage_account.app.id

  included_event_types = ["Microsoft.Storage.BlobCreated"]
  azure_function_endpoint {
    function_id = "${azurerm_linux_function_app.app.id}/functions/ProcessImage"
  }
}