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
    }
}
