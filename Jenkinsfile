pipeline {
    agent none
    
    stages {
        stage('Setup') {
            agent any
            steps {
                sh 'mkdir -p $HOME/maven_home && chown 1000:1000 $HOME/maven_home'
            }
        }
        stage('Build') {
            agent {
                docker {
                    image 'maven:3.8'
                    args '-v $HOME/maven_home:/maven -w /maven'
                }
            }
            steps {
                withCredentials([string(credentialsId: 'sonar-login', variable: 'SONAR_LOGIN')]) {
                    configFileProvider(
                        [configFile(fileId: 'my-global-maven-settings', variable: 'MAVEN_SETTINGS')]) {
                            git branch: 'main', url: 'https://github.com/buzypi/myproject.git'
                            sh 'MAVEN_OPTS="-Duser.home=/maven" mvn -gs $MAVEN_SETTINGS -Dmaven.test.failure.ignore=true clean deploy sonar:sonar -Dsonar.projectKey=myproject -Dsonar.login=${SONAR_LOGIN}'
                        }
                }
            }
        }
    }
}
