####################################################################################
# RG + Storage Account + File Share
####################################################################################

variable "main_resource_group_location" {
  description = "Location of the resource group to keep Storage Account"
  type = string
  default = "westeurope"
}

variable "main_resource_group_name" {
  description = "Name of the resource group to keep Storage Account"
  type = string
  default = "common-rg"
}

variable "main_storage_account_name" {
  type = string
  description = "Name of the Azure Storage Account"
  default = "michalantolikstorage"
}

variable "main_file_share_name" {
  type = string
  description = "Name of the Azure File Share within Azure Storage Account"
  default = "chemikpolice-jenkinshome"
}

####################################################################################
# RG + Azure Container Instances (ACI) running Docker image with Jenkins for CI/CD
####################################################################################

variable "aci_resource_group_location" {
  description = "Location of the resource group to keep ACI"
  type = string
  default = "westeurope"
}

variable "aci_resource_group_name" {
  description = "Name of the resource group to keep ACI"
  type = string
  default = "aci-chemikpolice-rg"
}

variable "aci_container_group_name" {
  description = "Name of the Azure Container Instances (ACI) container group"
  type = string
  default = "chemikpolice-cicd"
}

variable "aci_container_name" {
  description = "Name of the Azure Container Instances (ACI) container"
  type = string
  default = "chemikpolice-cicd-1"
}
