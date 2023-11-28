# main.tf
provider "azurerm" {
  features {}
}

module "aks_cluster" {
  source                  = "./modules/aks"
  resource_group_name     = "jfrog-rg1343"
  aks_cluster_name        = "myAKSCluster5589"
  aks_node_pool_name      = "nodepool1"
  aks_node_pool_vm_size   = "Standard_DS2_v2"
  aks_node_pool_min_count = 1
  aks_node_pool_max_count = 1
}
