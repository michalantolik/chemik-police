##############################################################################################
### Deploy to Azure Container Instances (ACI) - using Azure CLI
##############################################################################################

# https://learn.microsoft.com/en-us/azure/container-instances/container-instances-quickstart-powershell

##############################################################################################
### Login to Azure
##############################################################################################

Login-AzureRmAccount

##############################################################################################
### Select subscription
##############################################################################################

Set-AzureRmContext "My Sub"

##############################################################################################
### Deploy container instance to ACI
##############################################################################################

$resourceGroup = "aci-chemikpolice-rg"
$location = "westeurope"
$containerGroupName="chemikpolice"

New-AzureRmResourceGroup -Name $resourceGroup -Location $location

New-AzureRmContainerGroup -ResourceGroupName $resourceGroup `
    -Name $containerGroupName  `
    -Image michalantolik/chemik-police:latest   `
    -Port 80 `
    -IpAddressType Public `
    -DnsNameLabel chemikpolice

##############################################################################################
### Check deployment status
##############################################################################################

Get-AzureRmContainerGroup -ResourceGroupName $resourceGroup `
    -Name $containerGroupName

##############################################################################################
### See the logs
##############################################################################################

Get-AzureRmContainerInstanceLog -ResourceGroupName $resourceGroup `
    -ContainerGroupName $containerGroupName `

##############################################################################################
### Browse "DemoApp" running in container in ACI in webbrowse
##############################################################################################

# Use FQDN:        chemikpolice.westeurope.azurecontainer.io
# Use Public IP:   Find assigned IP address in Azure portal ...
