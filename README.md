# chemik-police

## Repository overview

This is a demo project presenting various DevOps tools and technologies.

It presents how to:

- Build custom Jenkins Docker image with support for .NET 7 SDK 👉 [repo](https://github.com/michalantolik/chemik-police/tree/main/ChemikPolice/DevOps/Jenkins-CustomDockerImage) 👉 [docs](https://learn.microsoft.com/en-us/dotnet/core/install/linux-debian)
- Publish custom Jenkins Docker image to Docker Hub 👉 [repo](https://github.com/michalantolik/chemik-police/tree/main/ChemikPolice/DevOps/Jenkins-CustomDockerImage) 👉 [dockerhub](https://hub.docker.com/repository/docker/michalantolik/jenkins-agent-dotnet/general)
- Run Jenkins from a Docker image on a localhost 👉 [repo](https://github.com/michalantolik/chemik-police/tree/main/ChemikPolice/DevOps/Jenkins-LocalServerLauncher) 👉 [docs](https://www.jenkins.io/doc/book/installing/docker/) 👉
- Run Jenkins from a Docker image in Azure Container Instances (ACI) 👉 [repo](https://github.com/michalantolik/chemik-police/tree/main/ChemikPolice/DevOps/Jenkins-AzureServerLauncher) 👉 [docs](https://www.jenkins.io/doc/book/installing/docker/)
- Creating Jenkins CI/CD pipeline as code for ASP.NET 7 web app 👉 [repo](https://github.com/michalantolik/chemik-police/blob/main/Jenkinsfile) 👉 [docs](https://www.jenkins.io/doc/book/pipeline/jenkinsfile/)
- Deploy ASP.NET 7 web app to Azure Container Instances (ACI) 👉 [repo](https://github.com/michalantolik/chemik-police/tree/main/ChemikPolice/DevOps/ChemikPoliceApp-Azure-ACI-Deployment) 👉 [docs](https://learn.microsoft.com/en-us/azure/container-instances/container-instances-quickstart)
- Deploy ASP.NET 7 web app to Azure Kubernetes Service (AKS) 👉 [repo](https://github.com/michalantolik/chemik-police/tree/main/ChemikPolice/DevOps/ChemikPoliceApp-Azure-AKS-Deployment) 👉 [docs](https://learn.microsoft.com/en-us/azure/aks/learn/quick-kubernetes-deploy-cli)

## Demo app

👉 http://chemikpolice-app.westeurope.azurecontainer.io

<img src="https://michalantolik.blob.core.windows.net/chemik-police/chemik-police-app-1.png" width="400">

## Technology stack

<img src="https://michalantolik.blob.core.windows.net/chemik-police/.Tech-Stack.png" width="400">

## CI/CD Pipeline

👉 [Jenkinsfile](https://github.com/michalantolik/chemik-police/blob/main/Jenkinsfile) (Jenkins pipeline)

👉 [Dockerfile](https://github.com/michalantolik/chemik-police/blob/main/ChemikPolice/DevOps/Jenkins-AgentImage/Dockerfile) (Jenkins agent image)

<img src="https://michalantolik.blob.core.windows.net/chemik-police/Jenkins_Pipeline_1.png" width="1000">
