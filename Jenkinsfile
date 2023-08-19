pipeline{
    agent any

    stages{

        //Implicit 'Checkout' stage

        stage('Restore'){
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

        stage('Build'){
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

        stage('Docker Build') {
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

        stage('Docker Run') {
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

        stage('Ping App') {
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

        stage('Docker Stop') {
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

        stage('Docker Remove') {
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
    }
}
