provider "azurerm" {
  features {}
}

terraform {
  backend "azurerm" {
    resource_group_name  = "cloud-shell-storage-centralindia"
    storage_account_name = "csg100320030cfafaaf"
    container_name       = "mani"
    key                  = "dev.terraform.tfstate"
  }
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
