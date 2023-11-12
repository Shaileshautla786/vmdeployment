
module "vm_deployement" {
  source = "./modules/Vm"
}


module "Storage_Account" {
  source = "./modules/Storage_Account"
}

module "App_Service" {
  source = "./modules/App_Service"
}

module "nsg_rule" {
  source                = "./modules/NSG_Rule"
}

module "Application_Gateway" {
  source = "./modules/Application_Gateway"
}

module "load_balancer" {
  source = "./modules/Load Balancer standard"
}

module "netapp_volume" {
  source = "./modules/NetApp_Volumes"
}