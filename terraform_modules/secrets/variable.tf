variable "key_vault_id" {
    type = string
    description = "The id of key vault the sercrets will be in"
}
variable "cosmosdb_authorizationkey_name" {
    type = string
    description = "The name of authorization key"
}

variable "cosmosdb_authorizationkey" {
    type = string
    description = "The authorization key to be saved in the key vault"
}

variable "init_storageconnectionkey_name" {
    type = string
    description = "The name of storage connection key"
}

variable "init_storageconnectionkey" {
    type = string
    description = "The connection key of init storage to be saved in the key vault"
}

variable "computervision_apikey_name" {
    type = string
    description = "The name of api key (computerVisionApiKey)"
}

variable "computervision_apikey" {
    type = string
    description = "The api key for computer vision"
}

variable "eventgridtopic_key_name" {
    type = string
    description = "The name of api key (eventGridTopicKey)"
}

variable "eventgridtopic_key" {
    type = string
    description = "The api key for event grid topic"
}