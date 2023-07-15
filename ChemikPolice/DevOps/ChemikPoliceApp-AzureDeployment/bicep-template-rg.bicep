targetScope = 'subscription'

@description('Location')
param location string = deployment().location

@description('Resource group name')
param resourceGroupName string = 'aci-chemikpolice-rg'

resource aciChemikPoliceRG 'Microsoft.Resources/resourceGroups@2022-09-01' = {
  name: resourceGroupName
  location: location
}
