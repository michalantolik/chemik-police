#################################################################################################################
### Deploy "ChemikPolice" webapp docker image to Azure Container Instances (ACI)
#################################################################################################################
#
# DEPLOYMENT_METHOD: Terraform
#
# IMAGE: michalantolik/chemik-police:latest
# FQDN:  http://[assigned-ip-address].westeurope.azurecontainer.io/
# PORT:  80
# DNS:   chemikpolice-app
# IP:    Public
#
# DOCS:  https://learn.microsoft.com/en-us/azure/container-instances/container-instances-quickstart-terraform
#
#################################################################################################################

#################################################################################################################
### Login to Azure
#################################################################################################################

Connect-AzAccount

#################################################################################################################
### Select subscription
#################################################################################################################

Set-AzureRmContext "My Sub"

#################################################################################################################
### Deploy container instance to ACI
#################################################################################################################

terraform validate

terraform plan -out plan.-out

terraform apply plan.out
