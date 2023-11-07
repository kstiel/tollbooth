output "app_object_id" {
    value = "${azurerm_linux_function_app.app.identity.0.principal_id}"
}

output "app_id" {
    value = "${azurerm_linux_function_app.app.id}"
}

# output "app_storage_account_id" {
#     value = "${azurerm_storage_account.app.id}"
# }