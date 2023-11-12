variable "load_balancer_name" {
  description = "Name of the Azure Load Balancer"
  default = "lb-prod-yarwpweusaps11"
}

variable "frontend_ip_configuration_name" {
  description = "Name of the frontend IP configuration"
  default = "myfrtip"
}

variable "backend_pool_name" {
  description = "Name of the backend address pool"
  default = "mybckpool"
}

variable "probe_name" {
  description = "Name of the health probe"
  default = "probe"
}

variable "LB_rule_name" {
  description = "Name of the load balancing rule"
  default = "rule"
}

variable "azurerm_resource_group" {
  description = "The name of the resource group in which the resources will be created."
  type        = string
  default = "Project"
}

variable "location" {
  description = "The location in which the resources will be created."
  type        = string
  default = "West Europe"
}

variable "private_ip_address_allocation" {
    default = "Dynamic"
}

variable "probe_port" {
    default = 80
}

variable "probe_protocol" {
    default = "Tcp"
}

variable "rule_front_port" {
    default = 80
}

variable "rule_backend_port" {
    default = 80
}

variable "rule_protocol" {
    default = "Tcp"
}

variable "subnet_name" {
  description = "Name of the existing Subnet to attach the Application Gateway"
  type = string
  default = "test" # mentioned subnet should not have any resource already deployed in it or else app gateway will not deploy.
}

variable "subnet_id" {
  default = "/subscriptions/01f72bbd-f2d4-4de2-8523-52f826e1ea97/resourceGroups/Project/providers/Microsoft.Network/virtualNetworks/Vnet-YARA-Project/subnets/test"
}



variable "virtual_network_name" {
  description = "Name of the existing Virtual Network containing the subnet"
  type = string
  default = "Vnet-YARA-Project"
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
