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
                    python3 -m venv venv
                    . venv/bin/activate
                    pip install -e .
                    export FLASK_APP=js_example
                    pip install -e '.[test]'
                    coverage run -m pytest
                    coverage report
                    deactivate
                """
        }
    }

    }
}
