####################################################################################
# RG + Storage Account + File Shares
#
# mount_paths: "/var/jenkins_home", "/var/run/docker.sock"
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

variable "jenkinshome_file_share_name" {
  type = string
  description = "Name of the Azure File Share for mounting '/var/jenkins_home' from the docker container"
  default = "chemikpolice-jenkins-home"
}

variable "dockrersocket_file_share_name" {
  type = string
  description = "Name of the Azure File Share for mounting '/var/run/docker.sock' from the docker container"
  default = "chemikpolice-dockerd-socket"
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
