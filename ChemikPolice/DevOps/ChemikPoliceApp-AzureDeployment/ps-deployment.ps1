##############################################################################################
### Deploy "ChemikPolice" webapp docker image to Azure Container Instances (ACI)
#
# TODO: Migrate this script from AzureRM to Az
#
# - https://learn.microsoft.com/en-us/powershell/azure/migrate-from-azurerm-to-az?view=azps-10.1.0
#
##############################################################################################
#
# IMAGE: michalantolik/chemik-police:latest
# FQDN:  http://chemikpolice.westeurope.azurecontainer.io/
# PORT:  80
# DNS:   chemikpolice
# IP:    public
#
# DOCS:  https://learn.microsoft.com/en-us/azure/container-instances/container-instances-quickstart-powershell
#
##############################################################################################

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

$location = "westeurope"
$resourceGroup = "aci-chemikpolice-rg"
$containerGroupName="chemikpolice-app"

New-AzureRmResourceGroup `
    -Name $resourceGroup `
    -Location $location

New-AzureRmContainerGroup `
    -ResourceGroupName $resourceGroup `
    -Name $containerGroupName  `
    -Image michalantolik/chemik-police:latest   `
    -Port 80 `
    -IpAddressType Public `
    -DnsNameLabel chemikpolice-app

##############################################################################################
### Check deployment status
##############################################################################################

Get-AzureRmContainerGroup `
    -ResourceGroupName $resourceGroup `
    -Name $containerGroupName

##############################################################################################
### See the logs
##############################################################################################

Get-AzureRmContainerInstanceLog `
    -ResourceGroupName $resourceGroup `
    -ContainerGroupName $containerGroupName `

##############################################################################################
### Browse "ChemikPolice" webapp running in container in ACI (in web browser)
##############################################################################################

# Use FQDN:        chemikpolice.westeurope.azurecontainer.io
# Use Public IP:   Find assigned public IP address in Azure portal ...
