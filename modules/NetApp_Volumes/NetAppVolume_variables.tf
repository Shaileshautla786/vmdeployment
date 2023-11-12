variable "resource_group_name" {
  description = "The name of the resource group in which the resources will be created."
  type        = string
  default = "Project"
}

variable "location" {
  description = "The location in which the resources will be created."
  type        = string
  default = "Korea South"
}

variable "azurerm_netapp_account" {
  description = "Existing NetApp Account name"
  type = string
  default = "saileshautlaa"
}

variable "azurerm_netapp_pool" {
  description = "Existing Capacity Pool name under Netapp account"
  default = "divyaautlaa"
}

variable "azurerm_netapp_volume" {
  description = "New Volume name"
  type        = string
  default     = "yarvolnetapp"
}

variable "usage_threshold" {
  default = "80"
}

variable "volume_protocol_types" {
  description = "List of protocol types for the NetApp volume."
  type        = list(string)
  default     = ["NFSv4.1", "CIFS"]
}

variable "existing_subnet_id" {
  description = "existing subnet id"
  default = "/subscriptions/01f72bbd-f2d4-4de2-8523-52f826e1ea97/resourceGroups/Project/providers/Microsoft.Network/virtualNetworks/Vnet-netapp-Volumee/subnets/dev"
}

variable "service_level" {
  description = "# Replace with your desired service level"
  default = "Premium"    
}

variable "volume_path" {
  default = "data"
}

variable "storage_quota_in_gb" {
  description = "# Replace with your desired storage quota"
  default = "1024" 
}

variable "throughput_in_mibps" {
  default = "1"
}

variable "tags" {
  type = map(string)
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