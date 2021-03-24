targetScope = 'subscription'

param environment string
param skuName string
param skuTier string

var location = deployment().location
var resourceNamePrefix = 'bicep-playground-${environment}'

var tags = {
  environment: environment
  provisionedBy: 'Bicep'
}

resource rg 'Microsoft.Resources/resourceGroups@2020-10-01'= {
  name: '${resourceNamePrefix}-rg'
  location: location
  tags: tags
}

var scope = resourceGroup(rg.name)

module serviceBus 'modules/servicebus.bicep' = {
  name: 'serviceBus'
  params: {
    location: location
    resourceNamePrefix: resourceNamePrefix
    tags: tags
  }
  scope: scope
}

module webapp 'modules/webapp.bicep' = {
  name: 'webapp'
  params: {
    location: location
    resourceNamePrefix: resourceNamePrefix
    skuName: skuName
    skuTier: skuTier
    serviceBusEndpoint: serviceBus.outputs.serviceBusEndpoint
    tags: tags
  }
  scope: scope
}
