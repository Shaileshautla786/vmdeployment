provider "azurerm" {
  features {}
}

data "azurerm_resource_group" "storage_Account" {
  name = var.azurerm_resource_group
}


# Create  storage account
resource "azurerm_storage_account" "Storage_Account" {
  name = var.storage_account_name
  resource_group_name     = data.azurerm_resource_group.storage_Account.name
  location                 = var.Storage_Account_location
  account_tier             = var.storage_account_tier
  account_replication_type = var.storage_account_replication
  # Other storage account configuration attributes
  tags = var.tags
}

output "storage_account_id" {
  value = azurerm_storage_account.Storage_Account.id
}

