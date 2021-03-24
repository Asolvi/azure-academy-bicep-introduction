param environment string
param skuName string
param skuTier string

var location = 'westeurope'
var resourceNamePrefix = 'bicep-playground-${environment}'

module webapp 'modules/webapp.bicep' = {
  name: 'webapp'
  params: {
    location: location
    resourceNamePrefix: resourceNamePrefix
    skuName: skuName
    skuTier: skuTier
  }
}
