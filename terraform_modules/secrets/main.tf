resource "azurerm_key_vault_secret" "computerVisionApiKey" {
  name = "${var.computervision_apikey_name}"
  value = "${var.computervision_apikey}"
  key_vault_id = "${var.key_vault_id}"
}

resource "azurerm_key_vault_secret" "eventGridTopicKey" {
  name = "${var.eventgridtopic_key_name}"
  value = "${var.eventgridtopic_key}"
  key_vault_id = "${var.key_vault_id}"
}

resource "azurerm_key_vault_secret" "cosmosDBAuthorizationKey" {
  name = "${var.cosmosdb_authorizationkey_name}"
  value = "${var.cosmosdb_authorizationkey}"
  key_vault_id = "${var.key_vault_id}"
}

resource "azurerm_key_vault_secret" "blobStorageConnection" {
  name = "${var.init_storageconnectionkey_name}"
  value = "${var.init_storageconnectionkey}"
  key_vault_id = "${var.key_vault_id}"
}