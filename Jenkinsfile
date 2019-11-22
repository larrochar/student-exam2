pipeline {

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
                    pip3 install --user -e .
                    export FLASK_APP=js_example
                """
        }
    }
    stage('Testing app') {
        steps {
                sh """
                    pip3 install --user -e '.[test]'
                    coverage run -m pytest
                    coverage report
                """
        }
    }
    }
}
