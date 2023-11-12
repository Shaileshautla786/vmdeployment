provider "azurerm" {
  features {}
}

data "azurerm_resource_group" "appgtw" {
  name = var.azurerm_resource_group
}

data "azurerm_virtual_network" "existing" {
  name                = var.virtual_network_name
  resource_group_name = data.azurerm_resource_group.appgtw.name
}

data "azurerm_subnet" "existing" {
  name                 = var.subnet_name
  resource_group_name  = data.azurerm_resource_group.appgtw.name
  virtual_network_name = data.azurerm_virtual_network.existing.name
}


resource "azurerm_public_ip" "pip" {
  name                = var.public_ip_name
  resource_group_name = data.azurerm_resource_group.appgtw.name
  location            = var.location
  allocation_method   = var.allocation_method
  sku          = var.public_sku
}


resource "azurerm_application_gateway" "main" {
  name                = var.application_gateway_name
  resource_group_name = data.azurerm_resource_group.appgtw.name
  location            = var.location

  sku {
    name     = var.sku_name
    tier     = var.sku_tier
    capacity = var.sku_capacity
  }

  gateway_ip_configuration {
    name      = var.gateway_ip_configuration
    subnet_id = var.existing_subnet_id
  }

  frontend_port {
    name = var.frontend_port_name
    port = 80
  }

  frontend_ip_configuration {
    name                 = var.frontend_ip_configuration_name
    public_ip_address_id = azurerm_public_ip.pip.id
  }

  backend_address_pool {
    name = var.backend_address_pool_name
  }

  backend_http_settings {
    name                  = var.http_setting_name
    cookie_based_affinity = var.cookie_based_affinity
    port                  = var.port
    protocol              = var.protocol
    request_timeout       = var.request_timeout
  }

  http_listener {
    name                           = var.listener_name
    frontend_ip_configuration_name = var.frontend_ip_configuration_name
    frontend_port_name             = var.frontend_port_name
    protocol                       = var.protocol
  }

  request_routing_rule {
    name                       = var.request_routing_rule_name
    rule_type                  = var.rule_type
    http_listener_name         = var.listener_name
    backend_address_pool_name  = var.backend_address_pool_name
    backend_http_settings_name = var.http_setting_name
    priority                   = var.priority
  }

  tags = var.tags
}
