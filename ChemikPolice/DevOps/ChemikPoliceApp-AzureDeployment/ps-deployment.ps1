#################################################################################################################
### Deploy "ChemikPolice" webapp docker image to Azure Container Instances (ACI)
#################################################################################################################
#
# IMAGE: michalantolik/chemik-police:latest
# FQDN:  http://chemikpolice.westeurope.azurecontainer.io/
# PORT:  80
# DNS:   chemikpolice-app
# IP:    Public
#
# DOCS:  https://learn.microsoft.com/en-us/azure/container-instances/container-instances-quickstart-powershell
#
#################################################################################################################

#################################################################################################################
### Login to Azure
#################################################################################################################

Connect-AzAccount

#################################################################################################################
### Select subscription
#################################################################################################################

Set-AzureRmContext "My Sub"

#################################################################################################################
### Deploy container instance to ACI
#################################################################################################################

$location = "westeurope"
$resourceGroupName = "aci-chemikpolice-rg"
$containerGroupName="chemikpolice-app"
$containerName="chemikpolice-app-1"

New-AzResourceGroup `
    -Name $resourceGroupName `
    -Location $location

$port = New-AzContainerInstancePortObject -Port 80 -Protocol TCP

$container = New-AzContainerInstanceObject `
    -Name $containerName `
    -Image "michalantolik/chemik-police:latest" `
    -Port $port

New-AzContainerGroup `
    -Name $containerGroupName `
    -ResourceGroupName $resourceGroupName `
    -Container $container `
    -Location $location `
    -IPAddressType Public `
    -IPAddressDnsNameLabel "chemikpolice-app"

#################################################################################################################
### Check deployment status
#################################################################################################################

$containerGroup = Get-AzContainerGroup `
    -ResourceGroupName $resourceGroupName `
    -Name $containerGroupName

$containerGroup.ProvisioningState

#################################################################################################################
### See the logs
#################################################################################################################

Get-AzContainerInstanceLog `
    -ContainerGroupName $containerGroupName `
    -ContainerName $containerName `
    -ResourceGroup $resourceGroupName

#################################################################################################################
### Browse "ChemikPolice" webapp running in container in ACI (in web browser)
#################################################################################################################

# Use FQDN:        chemikpolice-app.westeurope.azurecontainer.io
# Use Public IP:   Find assigned public IP address in Azure portal ...
