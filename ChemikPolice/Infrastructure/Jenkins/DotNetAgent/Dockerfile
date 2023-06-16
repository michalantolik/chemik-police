# Use base image
FROM jenkins/jenkins:lts

# Set image description
LABEL description="Jenkins LTS-based agent with .NET SDK"

# Switch to root to install .NET SDK
USER root

# Install "Web Get"
RUN apt-get update
RUN apt-get install wget

# Add Microsoft package signing key to the list of trusted keys and add the package repository
RUN wget https://packages.microsoft.com/config/debian/10/packages-microsoft-prod.deb -O packages-microsoft-prod.deb
RUN dpkg -i packages-microsoft-prod.deb
RUN rm packages-microsoft-prod.deb

# Install .NET SDK
RUN apt-get update
RUN apt-get install -y dotnet-sdk-7.0

# Switch back to jenkins user
USER jenkins
