param location string
param resourceNamePrefix string

resource servicebus 'Microsoft.ServiceBus/namespaces@2018-01-01-preview' = {
  location: location
  name: '${resourceNamePrefix}-servicebus'
  sku: {
    name: 'Basic'
    tier: 'Basic'
  }
}

output serviceBusEndpoint string = servicebus.properties.serviceBusEndpoint
