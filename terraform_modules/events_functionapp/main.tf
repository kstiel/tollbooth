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

resource "azurerm_storage_account" "events" {
  name                     = "${lower(var.events_storage_account_name)}${random_string.sixrandom.result}"
  resource_group_name      = "${var.resource_group_name}"
  location                 = "${var.location}"
  account_tier             = "Standard"
  account_replication_type = "RAGRS"
}

resource "azurerm_service_plan" "events" {
  name                = "${var.events_service_plan_name}"
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

resource "azurerm_linux_function_app" "events" {
  name                = "${var.events_function_app_name}${random_string.threerandom.result}"
  resource_group_name = "${var.resource_group_name}"
  location            = "${var.location}"
  storage_account_name       = azurerm_storage_account.events.name
  storage_account_access_key = azurerm_storage_account.events.primary_access_key
  service_plan_id            = azurerm_service_plan.events.id

  site_config {
    application_stack {
      node_version = "12"
    }
  }
}
