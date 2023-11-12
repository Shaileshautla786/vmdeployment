# modules/azure-load-balancer/main.tf
provider "azurerm" {
  features {}
}

data "azurerm_resource_group" "load_balancer" {
  name = var.azurerm_resource_group
}

data "azurerm_virtual_network" "existing" {
  name                = var.virtual_network_name
  resource_group_name = data.azurerm_resource_group.load_balancer.name
}

data "azurerm_subnet" "existing" {
  name                 = var.subnet_name
  resource_group_name  = data.azurerm_resource_group.load_balancer.name
  virtual_network_name = data.azurerm_virtual_network.existing.name
}

resource "azurerm_lb" "load_balancer" {
  name                = var.load_balancer_name
  location            = var.location
  resource_group_name = data.azurerm_resource_group.load_balancer.name
  tags = var.tags

  frontend_ip_configuration {
    name                 = var.frontend_ip_configuration_name
    subnet_id            = var.subnet_id
    private_ip_address_allocation = var.private_ip_address_allocation
  }
}

resource "azurerm_lb_backend_address_pool" "backend_pool" {
  name                = var.backend_pool_name
  loadbalancer_id     = azurerm_lb.load_balancer.id
}

resource "azurerm_lb_probe" "probe" {
  name                = var.probe_name
  protocol            = var.probe_protocol
  port                = var.probe_port
  loadbalancer_id     = azurerm_lb.load_balancer.id
}

resource "azurerm_lb_rule" "rule" {
    loadbalancer_id = azurerm_lb.load_balancer.id
  name                = var.LB_rule_name
  protocol            = var.rule_protocol
  frontend_port       = var.rule_front_port
  backend_port        = var.rule_backend_port
  frontend_ip_configuration_name = var.frontend_ip_configuration_name
  backend_address_pool_ids = [azurerm_lb_backend_address_pool.backend_pool.id]
  probe_id            = azurerm_lb_probe.probe.id
}
