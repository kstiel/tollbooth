resource "azurerm_cosmosdb_account" "tollbooth" {
  name                            = "${var.cosmosdb_account_name}"
  location                        = "${var.location}"
  resource_group_name             = "${var.resource_group_name}"
  offer_type                      = "Standard"
  enable_multiple_write_locations = false # Disabling multi-region writes


  geo_location {
    location          = "${var.location}"
    failover_priority = 0
    zone_redundant    = false
  }

  capabilities {
    name = "EnableServerless"
  }

  consistency_policy {
    consistency_level = "Session"
  }
}

resource "azurerm_cosmosdb_sql_database" "tollbooth" {
  name                = "${var.cosmosdb_sql_database_name}"
  resource_group_name = "${var.resource_group_name}"
  account_name        = azurerm_cosmosdb_account.tollbooth.name
}

resource "azurerm_cosmosdb_sql_container" "processed_container" {
  name                = "${var.cosmosdb_sql_processed_container_name}"
  resource_group_name = "${var.resource_group_name}"
  account_name        = azurerm_cosmosdb_account.tollbooth.name
  database_name       = azurerm_cosmosdb_sql_database.tollbooth.name
  partition_key_path  = "${var.cosmosdb_sql_processed_container_keypath}"
  #   Switching between autoscale and manual throughput is not supported via Terraform and must be completed via the Azure Portal and refreshed.
}

resource "azurerm_cosmosdb_sql_container" "man_review_container" {
  name                = "${var.cosmosdb_sql_manual_container_name}"
  resource_group_name = "${var.resource_group_name}"
  account_name        = azurerm_cosmosdb_account.tollbooth.name
  database_name       = azurerm_cosmosdb_sql_database.tollbooth.name
  partition_key_path  = "${var.cosmosdb_sql_manual_container_keypath}"
  #   Switching between autoscale and manual throughput is not supported via Terraform and must be completed via the Azure Portal and refreshed.
}
