output "storageconnectionkey" {
    value = "${azurerm_storage_account.init.primary_connection_string}"
}