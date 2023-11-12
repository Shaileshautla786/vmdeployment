
variable "nsg_name" {
  description = "Name of the existing Network Security Group"
  type = string
  default = "test"
}

variable "rule_name" {
  description = "Name for the inbound security rule"
  type = string
  default = "RDP"
}

variable "priority" {
  description = "Priority for the inbound rule"
  type = string
  default = "600"
}

variable "source_address_prefix" {
  description = "Source address prefix for the rule"
  type = list(string)
  default = ["10.0.0.0/24"]
}

variable "destination_port_range" {
  description = "Destination port range for the rule"
  type = string
  default = "3389"
}



variable "direction" {
  description = "rule to be applied in Inbound or Outbound"
  type = string
  default = "Outbound"
}

variable "access" {
  description = "Allow or deny"
  type = string
  default = "Allow"
}

variable "protocol" {
  description = "protocol on which rule will be created"
  type = string
  default = "Udp"
}

variable "source_port_range" {
  description = "source_port_range"
  type = string
  default = "3389"
}

variable "destination_address_prefix" {
  description = "destination_address_prefix"
  type = string
  default = "*"
}

variable "vnetname" {
  type = string
  description = "Specifiles exiting virtual network"
  default = "Vnet-YARA-Project"
}

variable "vnet_subnet" {
  type = string
  description = "Specifiles exiting virtual network subnet"
  default = "test"
}

variable "azurerm_resource_group" {
  type = string
  description = "existing resource group"
  default = "Project"
}