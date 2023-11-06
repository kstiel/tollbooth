variable "cognitive_account_name" {
    type = string
    description = "The name of the event grid topic"
}

variable "resource_group_name" {
    type = string
    description = "The name of the resource group that the event grid topic is in"
}

variable "location" {
    type =string
    description = "The location of the event grid topic"
}

variable "kind" {
    type = string
    default = "ComputerVision"
    description = "The kind of the cognitive service"
}