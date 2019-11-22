pipeline {

    agent any
    
    stages {
    stage('Building image') {
      steps {
            git branch: 'master',
            url: 'https://github.com/larrochar/student-exam2.git'
      }
        steps{ 
            sh """
                    pip3 install -e .
                    export FLASK_APP=js_example
                    pip3 install -e '.[test]'
                    coverage run -m pytest
                    coverage report
                """
        }
        steps{ 
            sh """
                    pip3 install -e '.[test]'
                    coverage run -m pytest
                    coverage report
                """
        }
           
        }
    }
  }
