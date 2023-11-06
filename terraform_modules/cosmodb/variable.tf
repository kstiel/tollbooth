variable "cosmosdb_account_name" {
  type = string
  description = "The name of cosmo db account"
}

variable "resource_group_name" {
    type = string
    description = "The name of the resource group that the cosmo db account is in"
}

variable "location" {
    type = string
    description = "The location of the strogate account"
}

variable "cosmosdb_sql_database_name" {
    type = string
    description = "The name of the sql database"
}

variable "cosmosdb_sql_processed_container_name" {
    type = string
    description = "The name of processed images container inside sql database"
}

variable "cosmosdb_sql_processed_container_keypath" {
    type = string
    description = "The keypath of processed container"
}

variable "cosmosdb_sql_manual_container_name" {
    type = string
    description = "The name of need-to-be-reviewed images container inside sql database"
}

variable "cosmosdb_sql_manual_container_keypath" {
    type = string
    description = "The keypath of manual container"
}