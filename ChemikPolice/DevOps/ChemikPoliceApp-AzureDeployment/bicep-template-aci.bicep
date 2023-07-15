@description('westeurope')
param location string = resourceGroup().location

@description('Container group name')
param containerGroupName string = 'chemikpolice-app'

@description('Container name')
param containerName string = 'chemikpolice-app-1'

resource containerGroup 'Microsoft.ContainerInstance/containerGroups@2023-05-01' = {
  name: containerGroupName
  location: location
  properties: {
    containers: [
      {
        name: containerName
        properties: {
          image: 'michalantolik/chemik-police:latest'
          ports: [
            {
              port: 80
            }
          ]
          resources: {
            requests: {
              cpu: 1
              memoryInGB: 4
            }
          }
        }
      }
    ]
    restartPolicy: 'OnFailure'
    osType: 'Linux'
    ipAddress: {
      type: 'Public'
      dnsNameLabel: 'chemikpolice-app'
      ports: [
        {
          protocol: 'TCP'
          port: 80
        }
      ]
    }
  }
}
