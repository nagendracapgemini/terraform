variable "resource_group_name" {
  description = "The name of the resource group in which to create the AKS cluster."
  type        = string
}

variable "aks_cluster_name" {
  description = "The name of the AKS cluster."
  type        = string
}

variable "aks_node_pool_name" {
  description = "The name of the AKS node pool."
  type        = string
}

variable "aks_node_pool_vm_size" {
  description = "The size of the Virtual Machine."
  type        = string
}


variable "aks_node_pool_min_count" {
  description = "The minimum number of nodes in the node pool."
  type        = number
}

variable "aks_node_pool_max_count" {
  description = "The maximum number of nodes in the node pool."
  type        = number
}
