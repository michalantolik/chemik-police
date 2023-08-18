pipeline{
    agent any

    stages{

        //Implicit 'Checkout' stage

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
        }

        stage('Docker Run') {
            steps {
                sh(script: 'docker container run -d --name chemikpolice -p 32769:80 michalantolik/chemik-police:latest')
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
                    echo "App started successfully :)"
                }
                failure {
                    echo "App failed to start :("
                }
            }
        }

        stage('Docker Stop') {
            steps {
                sh 'docker container stop chemikpolice'
            }
        }

        stage('Docker Remove') {
            steps {
                sh 'docker container rm chemikpolice'
            }
        }  
    }
}
