#############################################################################################################
# Create RG + Storage Account + File Share + ACI Group (with one container).
# Mount "/var/jenkins_home" from container to created File Share (to persist data).
# Mount "/var/run/docker.sock" from container to created File Share (to communicate with Docker daemon).
#
# FQDN:        chemikpolice-cicd.westeurope.azurecontainer.io:8080
# Public IP:   Find assigned IP address in Azure portal ...
#############################################################################################################

terraform init

terraform validate

terraform plan -out plan.out

terraform apply plan.out
