pipeline {
    agent {
        docker {
            image 'maven'
            args '-v /tmp:/usr/src/maven -w /usr/src/maven'
        }
    }

    stages {
        stage('Build') {
            steps {
                withCredentials([string(credentialsId: 'sonar-login', variable: 'SONAR_LOGIN')]) {
                    configFileProvider(
                        [configFile(fileId: 'my-global-maven-settings', variable: 'MAVEN_SETTINGS')]) {
                        sh 'MAVEN_OPTS="-Duser.home=/usr/src/maven" mvn -gs $MAVEN_SETTINGS -Dmaven.test.failure.ignore=true clean deploy sonar:sonar -Dsonar.projectKey=myproject -Dsonar.login=${SONAR_LOGIN}'
                    }
                }
            }
        }
    }
}
