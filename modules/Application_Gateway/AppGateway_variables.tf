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


variable "application_gateway_name" {
  description = "Name of the Azure Application Gateway"
  default = "app-gtw-yarwpweusaps11"
}

variable "public_ip_name" {
  description = "Name of the new Public IP"
  type = string
  default = "mypubip"
}

variable "subnet_name" {
  description = "Name of the existing Subnet to attach the Application Gateway"
  type = string
  default = "dev"
}



variable "virtual_network_name" {
  description = "Name of the existing Virtual Network containing the subnet"
  default = "Vnet-YARA-Project"
}


variable "backend_address_pool_name" {
    default = "myBackendPool"
}

variable "frontend_port_name" {
    default = "myFrontendPort"
}

variable "frontend_ip_configuration_name" {
    default = "myAGIPConfig"
}

variable "http_setting_name" {
    default = "myHTTPsetting"
}

variable "request_timeout" {
  default = 60
}

variable "port" {
  default = 80
}

variable "cookie_based_affinity" {
  default = "Disabled"
}

variable "listener_name" {
    default = "myListener"
}

variable "protocol" {
  default = "Http"
}

variable "request_routing_rule_name" {
    default = "myRoutingRule"
}

variable "rule_type" {
  default = "Basic"
}

variable "gateway_ip_configuration" {
  default = "mygatewayip"
}

variable "existing_subnet_id" {
  description = "existing subnet id"
  default = "/subscriptions/01f72bbd-f2d4-4de2-8523-52f826e1ea97/resourceGroups/Project/providers/Microsoft.Network/virtualNetworks/Vnet-YARA-Project/subnets/dev"
}

variable "request_routing_rule" {
  default  = 1
}

variable "priority" {
  default = 1
}

variable "sku_name" {
  default = "Standard_v2"
}

variable "sku_tier" {
  default = "Standard_v2"
}

variable "sku_capacity" {
  default = 2
}

variable "allocation_method" {
  default = "Static"
}

variable "public_sku" {
  default = "Standard"
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