# Use base image
FROM jenkins/jenkins:lts

# Set image description
LABEL description="Jenkins LTS-based agent with .NET SDK"

# Switch to root to install .NET SDK
USER root

# Install "Web Get"
RUN apt-get update
RUN apt-get install wget

####################################################################################################
# Install .NET SDK - https://learn.microsoft.com/en-us/dotnet/core/install/linux-debian
####################################################################################################

# Add Microsoft package signing key to the list of trusted keys and add the package repository
RUN wget https://packages.microsoft.com/config/debian/10/packages-microsoft-prod.deb -O packages-microsoft-prod.deb
RUN dpkg -i packages-microsoft-prod.deb
RUN rm packages-microsoft-prod.deb

# Install .NET SDK
RUN apt-get update
RUN apt-get install -y dotnet-sdk-7.0

####################################################################################################
# Install Docker - https://docs.docker.com/engine/install/debian/
####################################################################################################

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

# Switch back to jenkins user
USER jenkins
