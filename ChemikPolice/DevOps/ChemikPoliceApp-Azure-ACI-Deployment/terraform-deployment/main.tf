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
# Resource blocks
####################################################################################

# Deploy Azure Resources Group
resource "azurerm_resource_group" "main" {
    name = var.main_resource_group_name
    location = var.main_resource_group_location
}

# Deploy Azure Container Group (ACI)
resource "azurerm_container_group" "main" {
    name = var.main_container_group_name
    location = azurerm_resource_group.main.location
    resource_group_name = azurerm_resource_group.main.name
    ip_address_type = "Public"
    os_type = "Linux"

    container {
        name = var.main_container_name
        image = "michalantolik/chemik-police:latest"

        cpu = 1
        memory = 4

        ports {
            port = 80
            protocol = "TCP"
        }
    }
}
