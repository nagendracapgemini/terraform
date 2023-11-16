terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
    }
  }
}
provider "azurerm" {
  features {}
}
data "azurerm_resource_group" "g1" {
  name = "jfrog-rg"
  
}

resource "azurerm_storage_account" "sa" {
  name                     = "san13431343"
  resource_group_name      = data.azurerm_resource_group.g1.name
  location                 = data.azurerm_resource_group.g1.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_storage_container" "b1" {
  name                  = "bs1"
  storage_account_name  = azurerm_storage_account.sa.name
  container_access_type = "private"
}

resource "azurerm_storage_queue" "q" {
  name                 = "qu1"
  storage_account_name = azurerm_storage_account.sa.name
}
