pipeline {
    agent any
    
    stages {
        stage ('Fetch code '){
            steps {
                git branch: 'main', url: 'https://github.com/maisaarig/internship-final'
            }
        }
        stage ('Build '){
            steps {
                bat 'mvn clean install -DeskipTests'
            }
            post{
                success {
                    echo "Now archiving. Build stage"
                    archiveArtifacts artifacts: '**/*.war'
                }
            }
        }
        stage('UNIT TEST') {
            steps{
                bat 'mvn test'
            }
        }

        stage('Checkstyle ANALYSIS'){
            steps {
                bat 'mvn checkstyle:checkstyle'
            }
        }
        stage ('Sonar Analysis'){
            environment {
                scannerHome = tool 'sonarqube'
            }
            steps {
                withSonarQubeEnv('sonaqube') { // If you have configured more than one global server connection, you can specify its name
                bat '''%scannerHome%/bin/sonar-scanner -Dsonar.projectKey=demo \
                -Dsonar.projectName=demo3 \
                -Dsonar.projectVersion=1.0 \
                -Dsonar.sources=src/ \
                -Dsonar.java.binaries=target/test-classes/com/mycompany/formationspring/demo/ \
                -Dsonar.junit.reportPath=target/surefire-reports/ \
                -Dsonar.jacoco.reportPath=target/jacoco.exec \
                -Dsonar.java.checkstyle.reportPaths=target/checkstyle-result.xml'''
                }
            }
        }
        stage('Build docker image'){
            steps{
                script{
                    bat 'docker build -t maisaa/devops-integration .'
                }
            }
        }
        stage('Push image to Hub'){
            steps{
                script{
                   withCredentials([string(credentialsId: 'dockerhub-pwd', variable: 'dockerhubpwd')]) {
                   bat 'docker login -u maisaa -p ${dockerhubpwd}'

}
                   bat 'docker push maisaa/devops-integration'
                }
            }
        }
        stage ('Deploy to kbs') {
            steps {
                script {
                    kubernetesDeploy (configs: 'deploymentservice.yaml', kubeconfigId: 'configpwd')
                
                    
                    
                }
            }
        }
    }
}
