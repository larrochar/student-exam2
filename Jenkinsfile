pipeline {
    environment {
        registry = "larrochar/exam"
        registryCredential = 'dockerhub'
    }
    agent any
    stages {
        stage('Downloading git-repository') {
            steps {
                    git branch: 'master',
                    url: 'https://github.com/larrochar/student-exam2.git'
            }
        }
        stage('Building app') {
            steps {
                sh """
                    python3 -m venv venv
                    . venv/bin/activate
                    pip install -e .
                    export FLASK_APP=js_example
                """
            }
        }
    
        stage('Testing app') {
            steps {
                sh """
                    . venv/bin/activate
                    pip install -e '.[test]'
                    coverage run -m pytest
                    coverage report
                    deactivate
                """
            }
        }
        
        stage('Building image') {
            steps{
                script {
                    dockerImage = docker.build registry + ":$BUILD_NUMBER"
                }
            }
        }
        stage('Deploy Image') {
            steps{
                script {
                    docker.withRegistry( '', registryCredential ) {
                    dockerImage.push()
                    }
                }
            }
        }
        
        
    }
}
