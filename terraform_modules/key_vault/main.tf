resource "azurerm_key_vault" "tollbooth" {
  name                        = "${var.key_vault_name}"
  location                    = "${var.location}"
  resource_group_name         = "${var.resource_group_name}"
  enabled_for_disk_encryption = false
  tenant_id                   = "${var.tenant_id}"
  soft_delete_retention_days  = 7
  purge_protection_enabled    = false

  sku_name = "standard"

  access_policy {
    tenant_id = "${var.tenant_id}"
    object_id = "${var.app_object_id}"

    secret_permissions = [
      "Get",
    ]
  }

  access_policy {
    tenant_id = "${var.tenant_id}"
    object_id = "${var.object_id}"

    secret_permissions = [
      "Get",
      "List",
      "Set",
      "Delete"
    ]
  }
}