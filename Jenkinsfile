pipeline {
    agent {
        docker {
            image 'maven:3.8'
            args '-v /tmp:/usr/src/maven -w /usr/src/maven'
        }
    }
    
    stages {
        stage('Build') {
            steps {
                git branch: 'main', url: 'https://github.com/buzypi/myproject.git'
                sh 'MAVEN_OPTS="-Duser.home=/usr/src/maven" mvn -Dmaven.test.failure.ignore=true clean package'
            }
        }
    }
}
