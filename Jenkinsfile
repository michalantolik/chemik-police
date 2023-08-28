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
                    echo "Dotnet Restore stage succeedeed :)"
                }
                failure {
                    echo "Dotnet Restore stage failed :("
                }
            }
        }

        stage('Dotnet Build'){
            steps{
                sh 'dotnet build ChemikPolice/ChemikPoliceApp/ChemikPoliceApp.csproj'
            }
            post {
                success {
                    echo "Dotnet Build stage succeedeed :)"
                }
                failure {
                    echo "Dotnet Build stage failed :("
                }
            } 
        }

        stage('Run MSTest Tests'){
            steps{
                sh 'dotnet test ChemikPolice/ChemikPoliceMsTests/ChemikPoliceMsTests.csproj'
            }
            post {
                success {
                    echo "Run MSTest Tests stage succeedeed :)"
                }
                failure {
                    echo "Run MSTest Tests stage failed :("
                }
            }
        }

        stage('Run NUnit Tests'){
            steps{
                sh 'dotnet test ChemikPolice/ChemikPoliceNUnitTests/ChemikPoliceNUnitTests.csproj'
            }
            post {
                success {
                    echo "Run NUnit Tests stage succeedeed :)"
                }
                failure {
                    echo "Run NUnit Tests stage failed :("
                }
            }
        }

        stage('Run XUnit Tests'){
            steps{
                sh 'dotnet test ChemikPolice/ChemikPoliceXUnitTests/ChemikPoliceXUnitTests.csproj'
            }
            post {
                success {
                    echo "Run XUnit Tests stage succeedeed :)"
                }
                failure {
                    echo "Run XUnit Tests stage failed :("
                }
            }
        }        

        stage('Build App Docker Image') {
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
                    echo "Build App Docker Image' stage succeedeed :)"
                }
                failure {
                    echo "Build App Docker Image' stage failed :("
                }
            }
        }        

        stage('Run Containerized App') {
            steps {
                sh(script: 'docker container run -d --name chemikpolice -p 32769:80 michalantolik/chemik-police:latest')
            }
            post {
                success {
                    echo "Run Containerized App stage succeedeed :)"
                }
                failure {
                    echo "Run Containerized App stage failed :("
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
                    echo "Ping Containerized App stage succeedeed :)"
                }
                failure {
                    echo "Ping Containerized App stage failed :("
                }
            }
        }

        stage('Stop Containerized App') {
            steps {
                sh 'docker container stop chemikpolice'
            }
            post {
                success {
                    echo "Stop Containerized App stage succeedeed :)"
                }
                failure {
                    echo "Stop Containerized App stage failed :("
                }
            }
        }

        stage('Remove Stopped App Container') {
            steps {
                sh 'docker container rm chemikpolice'
            }
            post {
                success {
                    echo "Remove Stopped App Container stage succeedeed :)"
                }
                failure {
                    echo "Remove Stopped App Container stage failed :("
                }
            }
        }

        stage('Setup Anchore Docker Image Scanner') {
            steps {
                sh(script: """
                    ls -l ChemikPolice/DevOps/Anchore-Setup-in-Jenkins/compose-anchore-engine.sh
                    chmod +x ChemikPolice/DevOps/Anchore-Setup-in-Jenkins/compose-anchore-engine.sh
                    ls -l ChemikPolice/DevOps/Anchore-Setup-in-Jenkins/compose-anchore-engine.sh
                    bash ChemikPolice/DevOps/Anchore-Setup-in-Jenkins/compose-anchore-engine.sh
                """)
                sh(script: """
                    ls -l ChemikPolice/DevOps/Anchore-Setup-in-Jenkins/set-anchore-env-variables.sh
                    chmod +x ChemikPolice/DevOps/Anchore-Setup-in-Jenkins/set-anchore-env-variables.sh
                    ls -l ChemikPolice/DevOps/Anchore-Setup-in-Jenkins/set-anchore-env-variables.sh
                    bash ChemikPolice/DevOps/Anchore-Setup-in-Jenkins/set-anchore-env-variables.sh
                """)                
            }
            post {
                success {
                    echo "Setup Anchore Docker Image Scanner stage succeedeed :)"
                }
                failure {
                    echo "Setup Anchore Docker Image Scanner stage failed :("
                }
            }            
        }

        stage('Push App Docker Image to Docker Hub') {
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
            post {
                success {
                    echo "Push App Docker Image to Docker Hub stage succeedeed :)"
                }
                failure {
                    echo "Push App Docker Image to Docker Hub stage failed :("
                }
            }            
        }

        stage('Scan App Docker Image vulerabilities with Anchore') {
            steps {
                sh "echo 'michalantolik/chemik-police:latest' > anchore_images"
                sh "echo 'michalantolik/chemik-police:1.0' >> anchore_images"
                anchore name: 'anchore_images'
            }
            post {
                success {
                    echo "Scan App Docker Image vulerabilities with Anchore stage succeedeed :)"
                }
                failure {
                    echo "Scan App Docker Image vulerabilities with Anchore stage failed :("
                }
            }
        }

        stage('Scan App Docker Image vulerabilities with Trivy') {
            steps {
                sh 'trivy image michalantolik/chemik-police:latest'
                sh 'trivy image michalantolik/chemik-police:1.0'
            }
            post {
                success {
                    echo "VScan App Docker Image vulerabilities with Trivy stage succeedeed :)"
                }
                failure {
                    echo "Scan App Docker Image vulerabilities with Trivy stage failed :("
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
