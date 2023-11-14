provider "azurerm" {
  features {}
}
module "network" {
  source = "./modules/network"
  resource_group_name = "mani"
  location = "westus"
  subnet_id = module.network.subnet_id
}

module "virtual_machine" {
  source = "./modules/vm"
  subnet_id = module.network.subnet_id
  resource_group_name = "mani"
  location = "westus"
}
