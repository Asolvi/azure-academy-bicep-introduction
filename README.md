#Bicep introduction

The first few commits in this repository showcases how the Azure resources for a simple web app and a service bus can be set up using Bicep.

The commits are as follows:
1. Initial application. Deployable by running:
 `az deployment group create -f .\main.bicep -p .\parameters\azuredeploy.parameters.test.json --subscription "target-subscription" -g "target-resource-group"`

2. Added a service bus and added the service bus endpoint to the appsettings of the webapp.

3. Changed targetScope from resourceGroup to subscription. The resource group is then also provisioned by Bicep. Deployable by running:
`az deployment sub create -f .\main.bicep -p .\parameters\azuredeploy.parameters.test.json -l "westeurope" --subscription "target-subscription"`

4. Added tags to all resources. Tags is a great way to categorize resources to make it easier to identify the context they exist in, such as team, application, environment and criticality, to name a few.
