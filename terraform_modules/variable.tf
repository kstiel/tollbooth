variable "location" {
  type        = string
  description = "The location of resources in general"
  default     = "east us"
}

variable "key_vault_name" {
  type        = string
  description = "The name of the key vault"
  default     = "TollboothKeyVault"
}

variable "computervision_apikey_name" {
  type        = string
  description = "The name of computer vison api secret in key vault"
  default     = "computerVisionApiKey"
}

variable "eventgridtopic_key_name" {
  type        = string
  description = "The name of eventgridtopic secret in key vault"
  default     = "eventGridTopicKey"

}

variable "cosmosdb_authoricationkey_name" {
  type        = string
  description = "The name of cosmosdb account secret in key vault"
  default     = "cosmosDBAuthorizationKey"

}



variable "init_storage_authorizationkey_name" {
  type        = string
  description = "The name of init storage account secret in key vault"
  default     = "blobStorageConnection"

}

variable "init_storage_export_container_name" {
  type        = string
  description = "The name of export container in the init storage container"
  default     = "export"

}