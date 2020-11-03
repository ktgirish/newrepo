pipeline {
  agent any
  
  stages {
    stage('Parallel Test') {
      parallel {
        stage('Build Java 7') {
          steps {
            echo "Hello"
          }
        }
        stage('Build Java 7') {
          steps {
            echo "World!"
          }
        }
      }
    }
  }
}
