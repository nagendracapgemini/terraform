# modules/aks/main.tf
provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "aks_rg" {
  name     = var.resource_group_name
  location = "East US"
}

resource "azurerm_kubernetes_cluster" "aks_cluster" {
  name                = var.aks_cluster_name
  location            = azurerm_resource_group.aks_rg.location
  resource_group_name = azurerm_resource_group.aks_rg.name
  dns_prefix          = var.aks_cluster_name

  default_node_pool {
    name       = var.aks_node_pool_name
    vm_size    = var.aks_node_pool_vm_size
    node_count = var.aks_node_pool_min_count
  }

  network_profile {
    network_plugin = "azure"
  }

  service_principal {
    client_id     = "a04fcee1-556e-412b-90c5-512284a7d51e"
    client_secret = "Oks8Q~ZUPl66-Hh~7mSfv4zwMiNqPwrwY77XTcyK"
  }
}

output "aks_cluster_id" {
  value = azurerm_kubernetes_cluster.aks_cluster.id
}

output "kube_config_raw" {
  value = azurerm_kubernetes_cluster.aks_cluster.kube_config_raw
}
