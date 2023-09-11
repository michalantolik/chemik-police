# chemik-police

## Repository overview

This is a demo project presenting various DevOps tools and technologies.

It presents how to:

- Build custom Jenkins Docker image with support for .NET 7 SDK 👉 [repo](https://github.com/michalantolik/chemik-police/tree/main/ChemikPolice/DevOps/Jenkins-CustomDockerImage) 👉 [docs](https://learn.microsoft.com/en-us/dotnet/core/install/linux-debian)
- Publish custom Jenkins Docker image to Docker Hub 👉 [repo](https://github.com/michalantolik/chemik-police/tree/main/ChemikPolice/DevOps/Jenkins-CustomDockerImage) 👉 [dockerhub](https://hub.docker.com/repository/docker/michalantolik/jenkins-agent-dotnet/general)
- Run Jenkins from a Docker image on a localhost 👉 [repo](https://github.com/michalantolik/chemik-police/tree/main/ChemikPolice/DevOps/Jenkins-LocalServerLauncher) 👉 [docs](https://www.jenkins.io/doc/book/installing/docker/)
- Run Jenkins from a Docker image in Azure Container Instances (ACI) 👉 [repo](https://github.com/michalantolik/chemik-police/tree/main/ChemikPolice/DevOps/Jenkins-AzureServerLauncher) 👉 [docs](https://www.jenkins.io/doc/book/installing/docker/)
- Create Jenkins CI/CD pipeline as code for ASP.NET 7 web app 👉 [repo](https://github.com/michalantolik/chemik-police/blob/main/Jenkinsfile) 👉 [docs](https://www.jenkins.io/doc/book/pipeline/jenkinsfile/)
- Deploy ASP.NET 7 web app to Azure Container Instances (ACI) 👉 [repo](https://github.com/michalantolik/chemik-police/tree/main/ChemikPolice/DevOps/ChemikPoliceApp-Azure-ACI-Deployment) 👉 [docs](https://learn.microsoft.com/en-us/azure/container-instances/container-instances-quickstart)
- Deploy ASP.NET 7 web app to Azure Kubernetes Service (AKS) 👉 [repo](https://github.com/michalantolik/chemik-police/tree/main/ChemikPolice/DevOps/ChemikPoliceApp-Azure-AKS-Deployment) 👉 [docs](https://learn.microsoft.com/en-us/azure/aks/learn/quick-kubernetes-deploy-cli)

## Technology stack

<img src="https://michalantolik.blob.core.windows.net/chemik-police/.Tech-Stack.png" width="400">

## Demo ASP.NET 7 web app

👉 http://chemikpolice-app.westeurope.azurecontainer.io

<img src="https://michalantolik.blob.core.windows.net/chemik-police/chemik-police-app-1.png" width="400">

## Build custom Jenkins Docker image with support for .NET 7 SDK

👉 [ps-build.ps1](https://github.com/michalantolik/chemik-police/blob/main/ChemikPolice/DevOps/Jenkins-CustomDockerImage/ps-build.ps1) builds custom Jenkins Docker image

👉 [Dockerfile](https://github.com/michalantolik/chemik-police/blob/main/ChemikPolice/DevOps/Jenkins-CustomDockerImage/Dockerfile) defines Jenkins Docker image with all the tools required by the CI/CD pipeline:

- [NET SDK 7.0](https://learn.microsoft.com/en-us/dotnet/core/install/linux-debian)
- [Docker Engine](https://docs.docker.com/engine/install/debian/)
- [Azure CLI](https://learn.microsoft.com/en-us/cli/azure/install-azure-cli-linux?pivots=apt)
- [Terraform](https://developer.hashicorp.com/terraform/tutorials/azure-get-started/install-cli)
- [PowerShell](https://learn.microsoft.com/en-us/powershell/scripting/install/install-debian?view=powershell-7.3)
- [Python 3](https://cloudinfrastructureservices.co.uk/how-to-install-python-3-in-debian-11-10/)
- [PIPX 3](https://linuxhint.com/install-python-pip-debian/)
- [Trivy](https://aquasecurity.github.io/trivy/v0.44/getting-started/installation/)
- [Anchore CLI](https://docs.anchore.com/current/docs/deployment/anchore_cli/)

## Publish custom Jenkins Docker image to Docker Hub

👉 [ps-push.ps1](https://github.com/michalantolik/chemik-police/blob/main/ChemikPolice/DevOps/Jenkins-CustomDockerImage/ps-push.ps1) pushes custom Docker image to Docker Hub repository: [michalantolik/jenkins-agent-dotnet](https://hub.docker.com/repository/docker/michalantolik/jenkins-agent-dotnet/general)

## Run Jenkins from a Docker image on a localhost

👉 [ps-start-jenkins.ps1](https://github.com/michalantolik/chemik-police/blob/main/ChemikPolice/DevOps/Jenkins-LocalServerLauncher/ps-start-jenkins.ps1) starts Jenkins and MailHog SMTP server as containers on a localhost using [compose.yaml](https://github.com/michalantolik/chemik-police/blob/main/ChemikPolice/DevOps/Jenkins-LocalServerLauncher/compose.yaml)

👉 [ps-stop-jenkins.ps1](https://github.com/michalantolik/chemik-police/blob/main/ChemikPolice/DevOps/Jenkins-LocalServerLauncher/ps-stop-jenkins.ps1) stops Jenkins and MailHog SMTP server containers

## Run Jenkins from a Docker image in Azure Container Instances (ACI)

...

## CI/CD Pipeline

👉 [Jenkinsfile](https://github.com/michalantolik/chemik-police/blob/main/Jenkinsfile) (Jenkins pipeline)

👉 [Dockerfile](https://github.com/michalantolik/chemik-police/blob/main/ChemikPolice/DevOps/Jenkins-AgentImage/Dockerfile) (Jenkins agent image)

<img src="https://michalantolik.blob.core.windows.net/chemik-police/Jenkins_Pipeline_1.png" width="1000">
