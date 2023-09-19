targetScope = 'subscription'

@description('Resource Group location')
param resourceGroupLocation string = deployment().location

@description('Resource Group name')
param resourceGroupName string = deployment().name

resource aciChemikPoliceRG 'Microsoft.Resources/resourceGroups@2022-09-01' = {
  name: resourceGroupName
  location: resourceGroupLocation
}
