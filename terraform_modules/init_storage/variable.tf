variable "init_storage_account_name" {
  type = string
  description = "The name of init storage account which would be followed by 6 random letters"
}

variable "resource_group_name" {
    type = string
    description = "The name of the resource group that the storage account is in"
}

variable "location" {
    type = string
    description = "The location of the strogate account"
}


variable "images_container_name" {
    type = string
    description = "The name of the images container"
}

variable "export_container_name" {
    type = string
    description = "The name of the export container"
}

variable "app_function_app_id" {
    type = string
    description = "App end point for blob created events"
}