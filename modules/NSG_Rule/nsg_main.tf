provider "azurerm" {
  features {}
}

data "azurerm_resource_group" "nsg" {
  name = var.azurerm_resource_group
}
 
data "azurerm_virtual_network" "nsg_vnet" {
  name                = var.vnetname
  resource_group_name = data.azurerm_resource_group.nsg.name
}

data "azurerm_subnet" "worksubnet" {
  name                 = var.vnet_subnet
  resource_group_name  = data.azurerm_resource_group.nsg.name
  virtual_network_name = data.azurerm_virtual_network.nsg_vnet.name
}


resource "azurerm_network_security_rule" "inbound_rule" {
  name                        = var.rule_name
  priority                    = var.priority
  direction                   = var.direction
  access                      = var.access
  protocol                    = var.protocol
  source_port_range           = var.source_port_range
  destination_port_range      = var.destination_port_range
  source_address_prefixes = var.source_address_prefix
  destination_address_prefix  = var.destination_address_prefix
  resource_group_name         = data.azurerm_resource_group.nsg.name
  network_security_group_name = var.nsg_name
}
