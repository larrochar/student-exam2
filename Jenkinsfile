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
                    pip3 install -e .
                    export FLASK_APP=js_example
                    pip3 install -e '.[test]'
                    coverage run -m pytest
                    coverage report
                """
        }
    }
    stage('Testing app') {
        steps {
                sh """
                    pip3 install -e '.[test]'
                    coverage run -m pytest
                    coverage report
                """
        }
    }
    }
}
