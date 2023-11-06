output "authorizationkey" {
    value = "${azurerm_cosmosdb_account.tollbooth.primary_key}"
}

output "cosmosdb_endpoint" {
    value = "${azurerm_cosmosdb_account.tollbooth.endpoint}"
}

output "cosmosdb_database_id" {
    value = "${azurerm_cosmosdb_sql_database.tollbooth.id}"
}

output "cosmosdb_processed_container_id" {
    value = "${azurerm_cosmosdb_sql_container.processed_container.id}"
}