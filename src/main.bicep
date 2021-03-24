targetScope = 'subscription'

param environment string
param skuName string
param skuTier string

var location = deployment().location
var resourceNamePrefix = 'bicep-playground-${environment}'

resource rg 'Microsoft.Resources/resourceGroups@2020-10-01'= {
  name: '${resourceNamePrefix}-rg'
  location: location
}

var scope = resourceGroup(rg.name)

module serviceBus 'modules/servicebus.bicep' = {
  name: 'serviceBus'
  params: {
    location: location
    resourceNamePrefix: resourceNamePrefix
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
  }
  scope: scope
}
