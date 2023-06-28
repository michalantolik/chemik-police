##############################################################################################
### Deploy to Azure Container Instances (ACI) - using Azure CLI
##############################################################################################

# https://learn.microsoft.com/en-us/azure/container-instances/container-instances-quickstart

##############################################################################################
### Login to Azure
##############################################################################################

az login

##############################################################################################
### Select subscription
##############################################################################################

az account set -s "My Sub"

##############################################################################################
### Create resource group
##############################################################################################

az group create -n $resourceGroup -l $location

##############################################################################################
### Deploy container instance to ACI
##############################################################################################

$resourceGroup = "aci-chemikpolice-rg"
$location = "westeurope"
$containerGroupName="chemikpolice"

az group create -n $resourceGroup -l $location

az container create `-g $resourceGroup -n $containerGroupName `
    --image michalantolik/chemik-police:latest `
    --ports 80 `
    --ip-address public `
    --dns-name-label chemikpolice

##############################################################################################
### Check deployment status
##############################################################################################

az container show -g $resourceGroup -n $containerGroupName

##############################################################################################
### See the logs
##############################################################################################

az container logs -g $resourceGroup -n $containerGroupName

##############################################################################################
### Browse "DemoApp" running in container in ACI in webbrowse
##############################################################################################

# Use FQDN:        chemikpolice.westeurope.azurecontainer.io
# Use Public IP:   Find assigned IP address in Azure portal ...
