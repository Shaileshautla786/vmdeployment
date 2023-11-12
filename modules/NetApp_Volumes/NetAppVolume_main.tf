provider "azurerm" {
  features {}
}

data "azurerm_resource_group" "existing" {
  name = var.resource_group_name
}

data "azurerm_netapp_account" "existing" {
  name = var.azurerm_netapp_account
  resource_group_name = data.azurerm_resource_group.existing.name
}

data "azurerm_netapp_pool" "existing" {
  name = var.azurerm_netapp_pool
  account_name = data.azurerm_netapp_account.existing.name
  resource_group_name = data.azurerm_resource_group.existing.name
}

resource "azurerm_netapp_volume" "example" {
  name                = var.azurerm_netapp_volume
  location            = var.location
  resource_group_name = data.azurerm_resource_group.existing.name
  account_name        = data.azurerm_netapp_account.existing.name
  pool_name           = data.azurerm_netapp_pool.existing.name
  service_level       = var.service_level
  storage_quota_in_gb = var.storage_quota_in_gb 
  volume_path         = var.volume_path
  subnet_id           = var.existing_subnet_id
  throughput_in_mibps = var.throughput_in_mibps
  tags = var.tags
}
