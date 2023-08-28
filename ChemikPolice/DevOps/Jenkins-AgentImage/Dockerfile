# Use base image
FROM jenkins/jenkins:lts

# Set image description
LABEL description="Jenkins LTS-based agent with .NET SDK"

# Switch to root to install .NET SDK
USER root

# Install "Web Get"
RUN apt-get update
RUN apt-get install wget

##################################################################################################################################
# Install .NET SDK - https://learn.microsoft.com/en-us/dotnet/core/install/linux-debian
##################################################################################################################################

# Add Microsoft package signing key to the list of trusted keys and add the package repository
RUN wget https://packages.microsoft.com/config/debian/10/packages-microsoft-prod.deb -O packages-microsoft-prod.deb
RUN dpkg -i packages-microsoft-prod.deb
RUN rm packages-microsoft-prod.deb

# Install .NET SDK
RUN apt-get update
RUN apt-get install -y dotnet-sdk-7.0

##################################################################################################################################
# Install Docker - https://docs.docker.com/engine/install/debian/
##################################################################################################################################

# Update the apt package index and install packages to allow apt to use a repository over HTTPS
RUN apt-get update
RUN apt-get install ca-certificates curl gnupg

# Add Docker’s official GPG key
RUN install -m 0755 -d /etc/apt/keyrings
RUN curl -fsSL https://download.docker.com/linux/debian/gpg | gpg --dearmor -o /etc/apt/keyrings/docker.gpg
RUN chmod a+r /etc/apt/keyrings/docker.gpg

# Use the following command to set up the repository
RUN echo \
  "deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/debian \
  "$(. /etc/os-release && echo "$VERSION_CODENAME")" stable" | \
  tee /etc/apt/sources.list.d/docker.list > /dev/null

# Install Docker
RUN apt-get update 
RUN apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

##################################################################################################################################
# Install Python3     - https://cloudinfrastructureservices.co.uk/how-to-install-python-3-in-debian-11-10/
# Install Python3 PIP - https://linuxhint.com/install-python-pip-debian/
##################################################################################################################################

# Update the local package index and repositories as follows.
RUN apt-get update

# Install Dependencies
#RUN apt-get install build-essential zlib1g-dev libncurses5-dev libgdbm-dev libnss3-dev libssl-dev libreadline-dev libffi-dev libsqlite3-dev wget libbz2-dev

# install Python3 from Debian’s APT repository
RUN apt-get install python3 -y

# install Python3 PIP from Debian’s APT repository
RUN apt-get install python3-pip -y

##################################################################################################################################
# Install PowerShell - https://learn.microsoft.com/en-us/powershell/scripting/install/install-debian?view=powershell-7.3
##################################################################################################################################

# Save the public repository GPG keys
RUN curl https://packages.microsoft.com/keys/microsoft.asc | gpg --yes --dearmor --output /usr/share/keyrings/microsoft.gpg

# Register the Microsoft Product feed
RUN sh -c 'echo "deb [arch=amd64 signed-by=/usr/share/keyrings/microsoft.gpg] https://packages.microsoft.com/repos/microsoft-debian-bullseye-prod bullseye main" > /etc/apt/sources.list.d/microsoft.list'

# Install PowerShell
RUN apt update && apt install -y powershell

##################################################################################################################################
# Install Trivy - https://aquasecurity.github.io/trivy/v0.44/getting-started/installation/
##################################################################################################################################

RUN apt-get install wget apt-transport-https gnupg lsb-release -y
RUN wget -qO - https://aquasecurity.github.io/trivy-repo/deb/public.key | gpg --dearmor | tee /usr/share/keyrings/trivy.gpg > /dev/null
RUN echo "deb [signed-by=/usr/share/keyrings/trivy.gpg] https://aquasecurity.github.io/trivy-repo/deb $(lsb_release -sc) main" | tee -a /etc/apt/sources.list.d/trivy.list
RUN apt-get update
RUN apt-get install trivy

##################################################################################################################################
# Install Azure CLI - https://learn.microsoft.com/en-us/cli/azure/install-azure-cli-linux?pivots=apt
##################################################################################################################################

RUN apt-get update
RUN apt-get install ca-certificates curl apt-transport-https lsb-release gnupg

RUN mkdir -p /etc/apt/keyrings
RUN curl -sLS https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor | tee /etc/apt/keyrings/microsoft.gpg > /dev/null
RUN chmod go+r /etc/apt/keyrings/microsoft.gpg

RUN AZ_REPO=$(lsb_release -cs)
RUN echo "deb [arch=`dpkg --print-architecture` signed-by=/etc/apt/keyrings/microsoft.gpg] https://packages.microsoft.com/repos/azure-cli/ wheezy main" | tee /etc/apt/sources.list.d/azure-cli.list

RUN apt-get update
RUN apt-get install azure-cli -y

RUN az version

##################################################################################################################################
# Install Terraform - https://developer.hashicorp.com/terraform/tutorials/azure-get-started/install-cli
##################################################################################################################################

RUN apt-get update && apt-get install -y gnupg software-properties-common

RUN wget -O- https://apt.releases.hashicorp.com/gpg | \
        gpg --dearmor | \
        tee /usr/share/keyrings/hashicorp-archive-keyring.gpg

RUN gpg --no-default-keyring \
        --keyring /usr/share/keyrings/hashicorp-archive-keyring.gpg \
        --fingerprint

RUN echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] \
        https://apt.releases.hashicorp.com $(lsb_release -cs) main" | \
        tee /etc/apt/sources.list.d/hashicorp.list

RUN apt update
RUN apt-get install terraform
RUN terraform -help


