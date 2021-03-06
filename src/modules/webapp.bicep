param location string
param resourceNamePrefix string
param skuTier string
param skuName string
param serviceBusEndpoint string
param tags object

resource serverFarm 'Microsoft.Web/serverfarms@2020-06-01' = {
  location: location
  name: '${resourceNamePrefix}-sp'
  sku: {
    tier: skuTier
    name: skuName
  }
  tags: tags
}

resource webapp 'Microsoft.Web/sites@2020-06-01' = {
  location: location
  name: '${resourceNamePrefix}-webapp'
  properties: {
    serverFarmId: serverFarm.id
    siteConfig: {
      netFrameworkVersion: 'v5.0'
      appSettings: [
        {
          name: 'serviceBusEndpoint'
          value: serviceBusEndpoint
        }
      ]
    }
  }
  tags: tags
}
