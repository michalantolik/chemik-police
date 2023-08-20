pipeline{
    
    agent any

    stages{

        //Implicit 'Checkout' stage

        stage('Dotnet Restore'){
            steps{
                sh 'dotnet restore ChemikPolice/ChemikPoliceApp/ChemikPoliceApp.csproj'
            }
            post {
                success {
                    echo "Restore stage succeedeed :)"
                }
                failure {
                    echo "Restore stage failed :("
                }
            }
        }

        stage('Dotnet Build'){
            steps{
                sh 'dotnet build ChemikPolice/ChemikPoliceApp/ChemikPoliceApp.csproj'
            }
            post {
                success {
                    echo "Build stage succeedeed :)"
                }
                failure {
                    echo "Build stage failed :("
                }
            } 
        }

        stage('Run MSTest tests'){
            steps{
                sh 'dotnet test ChemikPolice/ChemikPoliceMsTests/ChemikPoliceMsTests.csproj'
            }
            post {
                success {
                    echo "MSTest stage succeedeed :)"
                }
                failure {
                    echo "MSTest stage failed :("
                }
            }
        }

        stage('Run NUnit tests'){
            steps{
                sh 'dotnet test ChemikPolice/ChemikPoliceNUnitTests/ChemikPoliceNUnitTests.csproj'
            }
            post {
                success {
                    echo "NUnit stage succeedeed :)"
                }
                failure {
                    echo "NUnit stage failed :("
                }
            }
        }

        stage('Run XUnit tests'){
            steps{
                sh 'dotnet test ChemikPolice/ChemikPoliceXUnitTests/ChemikPoliceXUnitTests.csproj'
            }
            post {
                success {
                    echo "XUnit stage succeedeed :)"
                }
                failure {
                    echo "XUnit stage failed :("
                }
            }
        }        

        stage('Build Image') {
            steps {
                sh(script: 'docker images -a')
                sh(script: """
                    docker images -a
                    docker build -f ChemikPolice/ChemikPoliceApp/Dockerfile -t michalantolik/chemik-police:latest .
                    docker build -f ChemikPolice/ChemikPoliceApp/Dockerfile -t michalantolik/chemik-police:1.0 .
                    docker images -a
                """)
            }
            post {
                success {
                    echo "Docker Build stage succeedeed :)"
                }
                failure {
                    echo "Docker Build stage failed :("
                }
            }
        }

        stage('Run Container') {
            steps {
                sh(script: 'docker container run -d --name chemikpolice -p 32769:80 michalantolik/chemik-police:latest')
            }
            post {
                success {
                    echo "Docker Run stage succeedeed :)"
                }
                failure {
                    echo "Docker Run stage failed :("
                }
            } 
        }

        stage('Ping Containerized App') {
            steps {
                pwsh(script: """
                    ls -l ./ChemikPolice/DevOps/ChemikPoliceApp-TestContainer/test-chemikpolice-container.ps1
                    chmod +x ./ChemikPolice/DevOps/ChemikPoliceApp-TestContainer/test-chemikpolice-container.ps1
                    ls -l ./ChemikPolice/DevOps/ChemikPoliceApp-TestContainer/test-chemikpolice-container.ps1
                    ./ChemikPolice/DevOps/ChemikPoliceApp-TestContainer/test-chemikpolice-container.ps1
                """)
            }
            post {
                success {
                    echo "Ping App stage succeedeed :)"
                }
                failure {
                    echo "Ping App stage failed :("
                }
            }
        }

        stage('Stop Container ') {
            steps {
                sh 'docker container stop chemikpolice'
            }
            post {
                success {
                    echo "Docker Stop stage succeedeed :)"
                }
                failure {
                    echo "Docker Stop stage failed :("
                }
            }
        }

        stage('Remove Container') {
            steps {
                sh 'docker container rm chemikpolice'
            }
            post {
                success {
                    echo "Docker Remove stage succeedeed :)"
                }
                failure {
                    echo "Docker Remove stage failed :("
                }
            }
        }

        stage('Push Container') {
            steps {
                echo "Workspace is $WORKSPACE"
                script {
                    docker.withRegistry("https://index.docker.io/v1/", "DockerHub-Credentials") {
                        def dockerfilePath = "${WORKSPACE}/ChemikPolice/ChemikPoliceApp/Dockerfile"
                        echo "${dockerfilePath}"
                        def imageLatest = docker.build("michalantolik/chemik-police:latest", "-f ${dockerfilePath} .")
                        def imageVersioned = docker.build("michalantolik/chemik-police:1.0", "-f ${dockerfilePath} .")
                        imageLatest.push()
                        imageVersioned.push()
                    }
                }
            }
        }

        stage('Setup Anchore Scanner') {
            steps {
                sh(script: """
                    ls -l ChemikPolice/DevOps/Anchore-Setup-in-Jenkins/compose-anchore-engine.sh
                    chmod +x ChemikPolice/DevOps/Anchore-Setup-in-Jenkins/compose-anchore-engine.sh
                    ls -l ChemikPolice/DevOps/Anchore-Setup-in-Jenkins/compose-anchore-engine.sh
                    bash ChemikPolice/DevOps/Anchore-Setup-in-Jenkins/compose-anchore-engine.sh
                """)
                sh(script: """
                    ls -l ChemikPolice/DevOps/Anchore-Setup-in-Jenkins/install-anchore-cli.sh
                    chmod +x ChemikPolice/DevOps/Anchore-Setup-in-Jenkins/install-anchore-cli.sh
                    ls -l ChemikPolice/DevOps/Anchore-Setup-in-Jenkins/install-anchore-cli.sh
                    bash ChemikPolice/DevOps/Anchore-Setup-in-Jenkins/install-anchore-cli.sh
                """)
                sh(script: """
                    ls -l ChemikPolice/DevOps/Anchore-Setup-in-Jenkins/set-anchore-env-variables.sh
                    chmod +x ChemikPolice/DevOps/Anchore-Setup-in-Jenkins/set-anchore-env-variables.sh
                    ls -l ChemikPolice/DevOps/Anchore-Setup-in-Jenkins/set-anchore-env-variables.sh
                    bash ChemikPolice/DevOps/Anchore-Setup-in-Jenkins/set-anchore-env-variables.sh
                """)                
            }
        }        

        stage('Vulerability scan'){
            parallel{
                stage('Vulerability scan with Trivy') {
                    steps {
                        sh 'trivy image michalantolik/chemik-police:latest'
                        sh 'trivy image michalantolik/chemik-police:1.0'
                    }
                    post {
                        success {
                            echo "Vulerability scan with Trivy stage succeedeed :)"
                        }
                        failure {
                            echo "Vulerability scan with Trivy stage failed :("
                        }
                    }
                }
                stage('Vulerability scan with Anchore') {
                    steps {
                        sh "echo 'michalantolik/chemik-police:latest' > anchore_images"
                        sh "echo 'michalantolik/chemik-police:1.0' >> anchore_images"
                        anchore name: 'anchore_images'
                    }
                    post {
                        success {
                            echo "Vulerability scan with Anchore stage succeedeed :)"
                        }
                        failure {
                            echo "Vulerability scan with Anchore stage failed :("
                        }
                    }
                }
            }
        }

        // https://app.pluralsight.com/course-player?clipId=c03028b7-571c-4a45-b07d-6de677b28f42
        // https://app.pluralsight.com/course-player?clipId=63fbfe90-6425-479a-96d3-f5335a99fac5
        // https://plugins.jenkins.io/azure-credentials/
        stage('Login to Azure') {
            steps {           
                withCredentials([azureServicePrincipal('jenkins-app')]) {
                    sh 'az login --service-principal -u $AZURE_CLIENT_ID -p $AZURE_CLIENT_SECRET -t $AZURE_TENANT_ID'
                    sh 'az account set --subscription $AZURE_SUBSCRIPTION_ID'
                }
            }
        }
    }

    post{
        always{
            script{
                emailext subject: "Job \'${JOB_NAME}\' (${BUILD_NUMBER}) ${currentBuild.result} finished its execution.",
                    body: "Please go to ${BUILD_URL} to see the details.",
                    to: "devops@acme.com",
                    recipientProviders: [upstreamDevelopers(), requestor()],
                    attachLog: true,
                    compressLog: true
            }
        }
    }    
}
