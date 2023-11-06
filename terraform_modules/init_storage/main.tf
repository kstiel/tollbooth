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

# Creating the Azure Storage Account for images and export
resource "azurerm_storage_account" "init" {
  name                     = "${lower(var.init_storage_account_name)}${random_string.sixrandom.result}"
  resource_group_name      = "${var.resource_group_name}"
  location                 = "${var.location}"
  account_tier             = "Standard"
  account_replication_type = "RAGRS"
}

# Creating the "images" container in the Storage Account
resource "azurerm_storage_container" "images" {
  name                  = "${var.images_container_name}"
  storage_account_name  = azurerm_storage_account.init.name
  container_access_type = "private"
}

# Creating the "export" container in the Storage Account
resource "azurerm_storage_container" "export" {
  name                  = "${var.export_container_name}"
  storage_account_name  = azurerm_storage_account.init.name
  container_access_type = "private"
}
