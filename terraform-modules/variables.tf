variable "resource_group_name" {
  description = "Name of the Azure Resource Group"
  type        = string
  default     = "UDP"
}

variable "location" {
  description = "Azure region for resources"
  type        = string
  default     = "eastus"
}
variable "subnet_id" {
  description = "Azure region for resources"
  type        = string
  default     = "mysubnet"
}
