variable "main_resource_group_location" {
  description = "Location of the resource group to keep other Azure resources (ACI)"
  type = string
  default = "westeurope"
}

variable "main_resource_group_name" {
  description = "Name of the resource group to keep other Azure resources (ACI)"
  type = string
  default = "aci-chemikpolice-rg"
}

variable "main_container_group_name" {
  description = "Name of the Azure Container Instances (ACI) container group"
  type = string
  default = "chemikpolice-app"
}

variable "main_container_name" {
  description = "Name of the Azure Container Instances (ACI) container"
  type = string
  default = "chemikpolice-app-1"
}
