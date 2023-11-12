variable "azurerm_resource_group" {
  description = "The name of the resource group in which the resources will be created."
  type        = string
  default = "Project"
}

variable "Storage_Account_location" {
  description = "The location in which the resources will be created."
  type        = string
  default = "West Europe"
}

variable "storage_account_name" {
  default = "sayarwpweusaps11"
}


variable "storage_account_sku" {
  description = "The SKU for the Azure Storage Account"
  type        = string
  default     = "Standard_LRS"
}

variable "storage_account_replication" {
  description = "The replication type for the Azure Storage Account"
  type        = string
  default     = "LRS"
}

variable "storage_account_tier" {
  description = "The tier for the Azure Storage Account"
  type        = string
  default     = "Standard"
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