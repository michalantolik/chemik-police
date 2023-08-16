####################################################################################
# Azure Provider
####################################################################################

# We strongly recommend using the required_providers block to set the
# Azure Provider source and version being used
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.0.0"
    }
  }
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {}
}

####################################################################################
# RG + Storage Account + File Share
####################################################################################

# Deploy Azure Resources Group
resource "azurerm_resource_group" "main" {
  name = var.main_resource_group_name
  location = var.main_resource_group_location
}

# Deploy Azure Storage Account
resource "azurerm_storage_account" "main" {
  name = var.main_storage_account_name
  location = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name
  account_tier = "Standard"
  account_replication_type = "LRS"
}

# Deploy Azure File Share
resource "azurerm_storage_share" "main" {
  name = var.main_file_share_name
  storage_account_name = azurerm_storage_account.main.name
  quota = 1
}
