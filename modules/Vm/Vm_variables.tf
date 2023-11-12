

variable "resource_group_name" {
  description = "The name of the resource group in which the resources will be created."
  type        = string
  default = "Project"
}

variable "location" {
  description = "The location in which the resources will be created."
  type        = string
  default = "West Europe"
}

variable "admin_password" {
  description = "The admin password to be used on the VMSS that will be deployed. The password must meet the complexity requirements of Azure."
  type        = string
  default = "P@wword@123"
}

variable "admin_username" {
  description = "The admin username of the VM that will be deployed."
  type        = string
  default = "ccpadmin"
}


variable "storage_account_type" {
  description = "Defines the type of storage account to be created. Valid options are Standard_LRS, Standard_ZRS, Standard_GRS, Standard_RAGRS, Premium_LRS."
  type        = string
  default = "Premium_LRS"
}

variable "vm_sizes" {
  description = "Specifies the size of the virtual machine."
  type        = list(string)
  default     = ["Standard_D2s_v3"]  # Default list of VM sizes
}

variable "vm_name" {
  description = "local name of the Virtual Machine."
  type        = string
  default     = "YARWPWEUSAPS01"
}
variable "vm_os_publisher" {
  description = "The name of the publisher of the image that you want to deploy. This is ignored when vm_os_id or vm_os_simple are provided."
  type        = string
  default     = "MicrosoftWindowsServer"
}

variable "vm_os_offer" {
  description = "The name of the offer of the image that you want to deploy. This is ignored when vm_os_id or vm_os_simple are provided."
  type        = string
  default     = "WindowsServer"
}

variable "vm_os_sku" {
  description = "The sku of the image that you want to deploy. This is ignored when vm_os_id or vm_os_simple are provided."
  type        = string
  default     = "2019-Datacenter"
}

variable "vm_os_version" {
  description = "The version of the image that you want to deploy. This is ignored when vm_os_id or vm_os_simple are provided."
  type        = string
  default     = "latest"
}

variable "data_sa_type" {
  description = "Data Disk Storage Account type."
  type        = string
  default     = "Premium_LRS"
}

variable "tags" {
  type = map(string)
  default = {
   "Created by" = "Sailesh"
    "Service offering type" = "IAAS"
    "managed by" = "ccpmanaged"
    "launch date" = "07September2023"
    "Owner" = "TeroLuukkanen" 
    "Application hosted" = "SAP"
    "SNOW RITM NUMBER" = "RITM0123456"
  }
}

variable "data_disks" {
  description = "(Optional) List of extra data disks attached to each virtual machine."
  type = string
  default = "0"
}

variable "license_type" {
  description = "Specifies the BYOL Type for this Virtual Machine. This is only applicable to Windows Virtual Machines. Possible values are Windows_Client and Windows_Server"
  type        = string
  default     = null
}

variable "bootstorage_rg" {
  type = string
  description = "Specifiles exiting virtual network"
  default = "Project"
}

variable "boot_diagnostics" {
  type = string
  description = "Boot Diagnostics"
  default = true
}

variable "boot_storage" {
  type = string
  description = "Specifiles exiting virtual network"
  default = "projectautla"
}

variable "vnetname" {
  type = string
  description = "Specifiles exiting virtual network"
  default = "Vnet-YARA-Project"
}

variable "vnet_subnet" {
  type = string
  description = "Specifiles exiting virtual network subnet"
  default = "prod"
}

variable "vnet_rg" {
  type = string
  description = "Specifiles exiting virtual network rg"
  default = "Project"
}

/*variable "lock_level" {
  type = string
  description = "Specifies the lock type for Virtual Machine that needs to be applied"
}
*/

variable "enable_accelerated_networking" {
  type        = bool
  default     = "true"
}

variable "post_build_activities_required" {
  type        = bool
  default     = "true"
}

variable "os_disk_size_in_gb" {
  type = string
  default = "128"
}

variable "subscription_app_sid" {
  type = string
  default = "01f72bbd-f2d4-4de2-8523-52f826e1ea97"
}


variable "add_vm_in_backup" {
  type        = bool
  default     = "true"
}

variable "vault_resource_group_name" {
  type        = string
  default     = "Project"
}

variable "recovery_vault_name" {
  type        = string
  default     = "testing"
}

variable "backup_policy_name" {
  type        = string
  default     = "prod"
}

variable "proximity_placement_group_id" {
#  type = string
  description = "Specifies the id of the exiting proximity placement group"
  default = null
}

variable "availability_set_id" {
  description = "Specifies the id of the exiting availability set"
  default = null
}

variable "create_option" {
  default = "Empty"
}

variable "disk_size_gb" {
  default = "1024"
}

variable "lun" {
  default = "0"
}

variable "caching" {
  default = "ReadWrite"
}

variable "private_ip_address_allocation" {
  default = "Dynamic"
}