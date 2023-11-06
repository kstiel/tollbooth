output "computerVisionApiKey" {
    value = "${azurerm_cognitive_account.tollbooth.primary_access_key}"
}

output "computerVisionEndPoint" {
    value = "${azurerm_cognitive_account.tollbooth.endpoint}"
}

# output "vomputervision_name" {
#     value = "${azurerm_cognitive_account.tollbooth.name}"
# }