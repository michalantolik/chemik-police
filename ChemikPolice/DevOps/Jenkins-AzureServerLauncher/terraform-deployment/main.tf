####################################################################################
# Azure Provider
####################################################################################

# We strongly recommend using the required_providers block to set the
# Azure Provider source and version being used
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.69.0"
    }
  }
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {}
}

####################################################################################
# RG + Storage Account + File Shares
#
# mount_paths: "/var/jenkins_home", "/var/run/docker.sock"
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

# Deploy Azure File Share for mounting "/var/jenkins_home" from the docker container
resource "azurerm_storage_share" "jenkinshome" {
  name = var.jenkinshome_file_share_name
  storage_account_name = azurerm_storage_account.main.name
  quota = 1
}

# Deploy Azure File Share for mounting "/var/run/docker.sock" from the docker container
resource "azurerm_storage_share" "dockersocket" {
  name = var.dockrersocket_file_share_name
  storage_account_name = azurerm_storage_account.main.name
  quota = 1
}

####################################################################################
# RG + Azure Container Instances (ACI) running Docker image with Jenkins for CI/CD
####################################################################################

#
# Deploy Azure Resources Group
#
resource "azurerm_resource_group" "aci" {
  name     = var.aci_resource_group_name
  location = var.aci_resource_group_location
}

#
# Deploy Azure Container Group (ACI)
#
resource "azurerm_container_group" "aci" {
  name                = var.aci_container_group_name
  location            = azurerm_resource_group.aci.location
  resource_group_name = azurerm_resource_group.aci.name
  ip_address_type     = "Public"
  dns_name_label      = "chemikpolice-cicd"
  os_type             = "Linux"

  container {
    name = var.aci_container_name
    image  = "michalantolik/jenkins-agent-dotnet:7.0"
    cpu    = "0.5"
    memory = "1.5"

    volume {
      name                 = "jenkins-home-volume"
      mount_path           = "/var/jenkins_home"
      read_only            = false      
      share_name           = azurerm_storage_share.jenkinshome.name
      storage_account_name = azurerm_storage_account.main.name
      storage_account_key  = azurerm_storage_account.main.primary_access_key
    }

    # TODO: Investigate Error which occurrs during "terraform apply" ...
    #
    # Error: exactly one of `empty_dir` volume, `git_repo` volume, `secret` volume ...
    # ... or storage account volume (`share_name`, `storage_account_name`, and `storage_account_key`) ...
    # ... must be specified
    volume {
      name                 = "docker-socket-volume"
      mount_path           = "/var/run/docker.sock"
      empty_dir            = true
    }

    ports {
      port     = 8080
      protocol = "TCP"
    }
  }
}
