resource "azurerm_cognitive_account" "tollbooth" {
  name                = "${var.cognitive_account_name}"
  location            = "${var.location}"
  resource_group_name = "${var.resource_group_name}"
  kind                = "${var.kind}"

  sku_name = "S1"
}