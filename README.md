# chemik-police

## Repository overview

This is a demo project presenting various DevOps tools and technologies.

It presents how to:

- Build custom Jenkins Docker image with support for .NET 7 SDK 👉 [repo](https://github.com/michalantolik/chemik-police/tree/main/ChemikPolice/DevOps/Jenkins-AgentImage)
- Run Jenkins CI/CD server from a Docker image on a localhost 👉 [repo](https://github.com/michalantolik/chemik-police/tree/main/ChemikPolice/DevOps/Jenkins-LocalServerLauncher) 👉 [docs](https://www.jenkins.io/doc/book/installing/docker/)  

## Demo app

👉 http://chemikpolice-app.westeurope.azurecontainer.io

<img src="https://michalantolik.blob.core.windows.net/chemik-police/chemik-police-app-1.png" width="400">

## Technology stack

<img src="https://michalantolik.blob.core.windows.net/chemik-police/.Tech-Stack.png" width="400">

## CI/CD Pipeline

👉 [Jenkinsfile](https://github.com/michalantolik/chemik-police/blob/main/Jenkinsfile) (Jenkins pipeline)

👉 [Dockerfile](https://github.com/michalantolik/chemik-police/blob/main/ChemikPolice/DevOps/Jenkins-AgentImage/Dockerfile) (Jenkins agent image)

<img src="https://michalantolik.blob.core.windows.net/chemik-police/Jenkins_Pipeline_1.png" width="1000">
