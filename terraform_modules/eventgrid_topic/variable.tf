variable "eventgrid_topic_name" {
    type = string
    description = "The name of the event grid topic"
}

variable "resource_group_name" {
    type = string
    description = "The name of the resource group that the event grid topic is in"
}

variable "location" {
    type = string
    description = "The location of the event grid topic"
}

variable "savePlateData_function_id" {
    type = string
    description = "Full function id for savePlateData function"
}

variable "checkup_function_id" {
      type = string
    description = "Full function id for QueuePlateForManualCheckup function"

}

# variable "processimage_function_name" {
#     type = string
#     description = "The name of the ProcessImage function in app function"
# }

# variable "app_function_id" {
#     type = string
#     description = "The id of the app function"
# }

# variable "app_function_storage_account_id" {
#     type = string
#     description = "The storage account id for functions app function"
# }

