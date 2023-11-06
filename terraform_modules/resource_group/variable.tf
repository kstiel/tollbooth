variable "base_name" {
  type = string
  description = "Base name for resource group (will be created followed by '-resource-group')"
}

variable "location" {
    type = string
    description = "The location of the resource group"
}