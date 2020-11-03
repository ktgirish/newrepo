pipeline {
  agent any
  
  stages {
    stage('Parallel Test') {
      parallel {
        stage('Test1') {
          steps {
            echo "Hello"
          }
        }
        stage('Test2') {
          steps {
            echo "World!"
          }
        }
      }
    }
  }
}
