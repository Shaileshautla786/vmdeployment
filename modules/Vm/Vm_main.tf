provider "azurerm" {
  features {}
}


data "azurerm_resource_group" "vm" {
  name = var.resource_group_name
}
 
data "azurerm_virtual_network" "sourcevnet" {
  name                = var.vnetname
  resource_group_name = var.vnet_rg
}

data "azurerm_subnet" "worksubnet" {
  name                 = var.vnet_subnet
  resource_group_name  = var.vnet_rg 
  virtual_network_name = data.azurerm_virtual_network.sourcevnet.name
}

resource "azurerm_network_interface" "vm" {
  name                          = "nic_01_${var.vm_name}"
  resource_group_name           = data.azurerm_resource_group.vm.name
  location                      = var.location
  enable_accelerated_networking = var.enable_accelerated_networking

  ip_configuration {
    name                          = "${var.vm_name}-ip"
    subnet_id                     = data.azurerm_subnet.worksubnet.id
    private_ip_address_allocation = var.private_ip_address_allocation
  }
  tags = var.tags
  
  lifecycle {
    prevent_destroy = false
    ignore_changes = [tags,]
  }
}

data "azurerm_storage_account" "vm" {
  name = var.boot_storage
  resource_group_name = var.bootstorage_rg
}

resource "azurerm_virtual_machine" "vm-windows" {
  proximity_placement_group_id  = var.proximity_placement_group_id
  availability_set_id           = var.availability_set_id
  name                          = var.vm_name
  resource_group_name           = data.azurerm_resource_group.vm.name
  location                      = coalesce(var.location, data.azurerm_resource_group.vm.location)
  vm_size                       = var.vm_sizes[0]
  network_interface_ids         = [azurerm_network_interface.vm.id]
  license_type                  = var.license_type
  delete_os_disk_on_termination = true
  delete_data_disks_on_termination = true
  storage_image_reference {
    publisher = var.vm_os_publisher
    offer     = var.vm_os_offer
    sku       = var.vm_os_sku
    version   = var.vm_os_version
  }

  storage_os_disk {
    name              = "${var.vm_name}_osdisk"
    create_option     = "FromImage"
    caching           = "ReadWrite"
    managed_disk_type = var.storage_account_type
    disk_size_gb      = var.os_disk_size_in_gb
  }

  storage_data_disk {
    name              = "${var.vm_name}-datadisk"
    create_option    = var.create_option
    disk_size_gb = var.disk_size_gb
    lun = var.lun
    caching   = var.caching
  }
  
  os_profile {
    computer_name         = var.vm_name
    admin_username        = var.admin_username
    admin_password        = var.admin_password
  }

  os_profile_windows_config {
    provision_vm_agent = true
  }

  tags = var.tags

  boot_diagnostics {
    enabled = var.boot_diagnostics
    storage_uri = data.azurerm_storage_account.vm.primary_blob_endpoint
  }
  
  lifecycle {
    prevent_destroy = false
}
}

data "azurerm_backup_policy_vm" "policy" {
  name                = var.backup_policy_name
  recovery_vault_name = var.recovery_vault_name
  resource_group_name = var.vault_resource_group_name
}


resource "azurerm_backup_protected_vm" "vm" {
  count               = var.add_vm_in_backup ? 1 : 0

  resource_group_name = data.azurerm_backup_policy_vm.policy.resource_group_name
  recovery_vault_name = data.azurerm_backup_policy_vm.policy.recovery_vault_name
  source_vm_id        = azurerm_virtual_machine.vm-windows.id
  backup_policy_id    = data.azurerm_backup_policy_vm.policy.id


  timeouts {
    delete = "10m"
  }

  lifecycle {
    prevent_destroy = false
    ignore_changes = all
  }
}

