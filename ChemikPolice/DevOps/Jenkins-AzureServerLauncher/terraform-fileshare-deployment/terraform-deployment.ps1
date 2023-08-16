####################################################################################
# Create RG + Storage Account + File Share
####################################################################################

terraform init

terraform validate

terraform plan -out plan.out

terraform apply plan.out
