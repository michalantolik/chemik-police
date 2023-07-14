az login                       # login to azure
az account set -s "My Sub"     # select subscription

$location = "westeurope"

$commonResourceGroup = "common-rg"
$storageAccountName = "michalantolikstorage"
$shareName = "chemikpolice-jenkinshome"

$chemikPoliceResourceGroup = "chemikpolice-rg"
$containerGroupName = "chemikpolice-cicd"

##########################################################################
### Create Storage Account
##########################################################################

az group create -n $commonResourceGroup -l $location

az storage account create -g $commonResourceGroup `
    -n $storageAccountName `
    --sku Standard_LRS

##########################################################################
### Get Storage Account Connection String as environment variable
##########################################################################

$storageConnectionString = `
    az storage account show-connection-string `
    -n $storageAccountName -g $commonResourceGroup `
    --query connectionString -o tsv

$env:AZURE_STORAGE_CONNECTION_STRING =$storageConnectionString

##########################################################################
### Create Azure File Share within Storage Account
##########################################################################

az storage share create -n $shareName

##########################################################################
### Get Storage Account Key
##########################################################################

$storageKey = $(az storage account keys list `
    -g $commonResourceGroup --account-name $storageAccountName `
    --query "[0].value" --output tsv)

##########################################################################
### Deploy container instance to ACI
##########################################################################

az group create -n $chemikPoliceResourceGroup -l $location

az container create `
    -g $chemikPoliceResourceGroup `
    -n $containerGroupName `
    --image michalantolik/jenkins-agent-dotnet:7.0 `
    --ports 8080 `
    --ip-address public `
    --dns-name-label chemikpolice-cicd `
    --azure-file-volume-account-name $storageAccountName `
    --azure-file-volume-account-key $storageKey `
    --azure-file-volume-share-name $shareName `
    --azure-file-volume-mount-path "/var/jenkins_home" 

##########################################################################
### Check deployment status, see the logs, browse the app running in ACI
##########################################################################

az container show -g $chemikPoliceResourceGroup -n $containerGroupName
az container logs -g $chemikPoliceResourceGroup -n $containerGroupName

# Use FQDN:        chemikpolice-cicd.westeurope.azurecontainer.io:8080
# Use Public IP:   Find assigned IP address in Azure portal ...
