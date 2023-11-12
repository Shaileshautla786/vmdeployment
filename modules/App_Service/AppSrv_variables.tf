
variable "azurerm_resource_group" {
    description = "Existing-resource-group"
    type = string
    default = "Project"
}

variable "location" {
  description = "The Azure region where resources will be deployed"
  type        = string
  default = "West Europe"  # Set the default value to one of the regions
}

variable "app_service_name" {
  description = "Name of the Azure App Service."
  default = "app-srv-yarwpweusaps11"
}

variable "size" {
  description = "SKU configuration for the App Service Plan."
  default     = "S1"
}

variable "tier" {
  default = "Standard"
}

variable "app_settings" {
  description = "Map of App Service application settings."
  type        = map(string)
  default     = {
    "APP_SETTING_KEY" = "APP_SETTING_VALUE"
  }
}

variable "connection_strings" {
  description = "Map of connection strings for the App Service."
  type        = map(string)
  default     = {
    "MyDatabase" = "Server=myserver;User Id=myuser;Password=mypassword;Database=mydb;"
  }
}

variable "tags" {
  type    = map(string)
  default = {
   "Created by" = "Sailesh"
    "Service offering type" = "PAAS"
    "managed by" = "ccpmanaged"
    "launch date" = "05Sept2023"
    "Owner" = "TeroLuukkanen" 
    "Application hosted" = "SAP"
    "SNOW RITM NUMBER" = "RITM0123456"
  }
}
