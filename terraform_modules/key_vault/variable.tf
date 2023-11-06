variable "key_vault_name" {
  type = string
  description = "The name of key vault"
}

variable "resource_group_name" {
    type = string
    description = "The name of the resource group that the events storage account is in"
}

variable "location" {
    type = string
    description = "The location of the strogate account"
}

variable "tenant_id" {
    type = string
    description = "Tenant id for the user to operate on this key vault"
}

variable "app_object_id" {
    type = string
    description = "The function app that will have GET access to this key vault"
}

variable "object_id" {
    type = string
    description = "The user's object id that will have GET, LIST, and SET aceess"
}