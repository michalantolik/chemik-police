# chemik-police

## Repository overview

The purpose of this repository is to practice and present various DevOps related tools and technologies.

It contains quite an empty example ASP.NET Core web application and various DevOps files and scripts (Infratructure as Code).

The motivation is to use as many DevOps tools and technologies in this repo and it is possible - which is on purpose redundant.

This is just to show the various tools and techniques used to achieve the same goals.

## How this repository is being developed

I am extending this repository as I am learning new DevOps stuff - mainly from Pluralsight courses.

This is done to make it possible to come back to what I have already learnt and to quickly refresh my skills by looking at working examples.

## Technology stack

- NET 7.0
- ARM Templates
- Azure
- Azure CLI
- Azure Container Instances
- Bicep
- Docker
- Jenkins CI/CD
- PowerShell

## Practiced tasks
- [x] Create example ASP.NET Core webapp (NET 7) 👉 [commit](https://github.com/michalantolik/devops-aspnetcore-mvc/commit/6ec382cd81a8ffb0fe266ce239df693f784576b4)
- [x] Add Docker support within VS Code 👉 [commit](https://github.com/michalantolik/devops-aspnetcore-mvc/commit/d180a4a3c2761c9f9ef95f5e32689afc4a9bd47c) 👉 [pluralsight](https://app.pluralsight.com/course-player?clipId=ad32d37c-211e-4b40-8560-34f683369147)
- [x] Run Jenkins and MailHog in Docker 👉 [commit](https://github.com/michalantolik/devops-aspnetcore-mvc/commit/241ea66082715094bad98c4e13c85ba35d21aa3d) 👉 [pluralsight](https://app.pluralsight.com/course-player?clipId=716dc35e-1797-4bb9-b160-1812b2bf878f)
- [x] Create Dockerfile for Jenkins agent with NET SDK 7 👉 [commit](https://github.com/michalantolik/chemik-police/commit/96c57afbe87a626f4d0853268bab8af6abc84f2a) 👉 [pluralsight](https://app.pluralsight.com/course-player?clipId=1e5f5331-6120-441e-bb51-c8def0c092f4) 👉 [microsoft](https://learn.microsoft.com/en-us/dotnet/core/install/linux-debian)
- [x] Generate Jenkinsfile from template 👉 [commit](https://github.com/michalantolik/chemik-police/commit/01209761ee9db70e7c712e085613973e5e69cbd8) 👉 [pluralsight](https://app.pluralsight.com/course-player?clipId=757a2b77-e337-4e7a-9288-cfff8a89970c)
- [x] Add configuration to trigger Jenkins jobs from VS Code 👉 [commit](https://github.com/michalantolik/chemik-police/commit/eeb3cbc16f5a37c23fec785f4e35bcbf835bf2a6) 👉 [pluralsight](https://app.pluralsight.com/course-player?clipId=757a2b77-e337-4e7a-9288-cfff8a89970c)
- [x] Update Jenkinsfile to checkout, restore, build and publish 👉 [commit](https://github.com/michalantolik/chemik-police/commit/623e014a6a4ac327d4cdfaacb447285244a920cb)
- [x] Add test projects with dummy tests (MSUnit, NUnit and xUnit) 👉 [commit](https://github.com/michalantolik/chemik-police/commit/f33165d2879f7fc4fe553c0a1005d5069f491b52)
- [x] Update Jenkinsfile to run tests 👉 [commit](https://github.com/michalantolik/chemik-police/commit/52b8d10256fcefdc21894878d1a6e7ffe531628a)
- [x] Add SCM poll trigger to Jenkinsfile 👉 [commit](https://github.com/michalantolik/chemik-police/commit/89f3f1f75802f4043f1623f42ea8f704f85c462f) 👉 [pluralsight](https://app.pluralsight.com/course-player?clipId=0a7a21a6-3d0e-44a8-b032-7195871e1aba) 👉 [pipeline syntax](https://www.jenkins.io/doc/book/pipeline/syntax/)
- [x] Remove SCM poll trigger 👉 [commit](https://github.com/michalantolik/chemik-police/commit/3674aee54170d663ee375947e48ff732abe3edca)
- [x] Send email notification about Jenkins job completion 👉 [commit](https://github.com/michalantolik/chemik-police/commit/b5c91e3df936008f003db279db9b7f6503aebb27) 👉 [pluralsight](https://app.pluralsight.com/course-player?clipId=bd474e17-7775-4ea6-a014-35defd116017)
- [x] Remove explicit git repo checkout stage from Jenkinsfile 👉 [commit](https://github.com/michalantolik/chemik-police/commit/fdd2cdd0e3c67ff9985c33de505827c0beaa1d0b) 👉 [pluralsight](https://app.pluralsight.com/course-player?clipId=b77dc7e6-e1c8-40e0-a0a5-47594674aa6c)
- [x] Build Docker image for ChemikPoliceApp and publish to DockerHub 👉 [commit](https://github.com/michalantolik/chemik-police/commit/eb159bf9c5e2564d2b925cdc5a65111d9f713cb6)
- [x] Deploy ChemikPoliceApp from Docker image to Azure Container Instances (ACI) using Azure CLI 👉 [commit](https://github.com/michalantolik/chemik-police/commit/a493b52d6216a9b6c278fa07211d51923ae97292) 👉 [pluralsight](https://app.pluralsight.com/course-player?clipId=009003f1-44b9-4f2a-9e88-f3ff99fb1e91)
- [x] Deploy ChemikPoliceApp from Docker image to Azure Container Instances (ACI) using PowerShell 👉 [commit](https://github.com/michalantolik/chemik-police/commit/9f9c510eaa6ea89d79119722089d98acf21b04d4) 👉 [pluralsight](https://app.pluralsight.com/course-player?clipId=e372de5d-249b-47ff-a628-23c27bc467f2)
- [x] Run Jenkins CI/CD server in Azure Container Instance (ACI) with Azure File Share Volume 👉 [commit](https://github.com/michalantolik/chemik-police/commit/42bcac1a9e6800d761e9badfb84348e7e7e1e369) 👉 [pluralsight](https://app.pluralsight.com/course-player?clipId=6bbbe60e-d5f2-444d-aeb4-26ab6ffd1a5a)
- [x] Install Docker for Jenkins CI/CD agent image 👉 [commit](https://github.com/michalantolik/chemik-police/commit/70da09e04f68b79af43adbc21be146770de8933e) 👉 [docs](https://docs.docker.com/engine/install/debian/) 👉 [pluralsight](https://app.pluralsight.com/course-player?clipId=d8054b73-371b-4a73-8e25-eab793364327)
- [x] Migrate ChemikPoliceApp PowerShell deployment script from AzureRM to Az module 👉 [commit](https://github.com/michalantolik/chemik-police/commit/a1493716031ab7f84bff6264fa69e9dbe7dedc92) 👉 [docs](https://learn.microsoft.com/en-us/powershell/azure/migrate-from-azurerm-to-az?view=azps-10.1.0)
- [x] Deploy ChemikPoliceApp with Bicep and Azure CLI 👉 [commit](https://github.com/michalantolik/chemik-police/commit/bc142d434a0e522de7169d4ce20c4ce34897e5ed) 👉 [bicep](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/) 👉 [bicep cli](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/deploy-cli) 👉 [pluralsight](https://app.pluralsight.com/course-player?clipId=2bacf121-b08b-4368-9d2c-8e6a44abb755)
- [x] Deploy ChemikPoliceApp with ARM Template and Azure CLI 👉 [commit](https://github.com/michalantolik/chemik-police/commit/f956d845cd3160c2212f30f729013211eddc1afb) 👉 [arm](https://learn.microsoft.com/en-us/azure/azure-resource-manager/templates/) 👉 [arm cli](https://learn.microsoft.com/en-us/azure/azure-resource-manager/templates/deploy-cli) 👉 [pluralsight](https://app.pluralsight.com/library/courses/arm-templates-terraform-it-ops-sessions/)
- [x] Deploy ChemikPoliceApp with Terraform 👉 [commit](https://github.com/michalantolik/chemik-police/commit/d16bf883438612c2eed2ec4e05308a9450168b73) 👉 [docs](https://learn.microsoft.com/en-us/azure/container-instances/container-instances-quickstart-terraform) 👉 [pluralsight](https://www.linkedin.com/learning/introduction-to-terraform-on-azure/getting-started)
