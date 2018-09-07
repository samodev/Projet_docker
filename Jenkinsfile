pipeline {
	agent any
	stages {
		stage('Git Clone') {
			steps {
				git ([url: "https://github.com/samodev/Projet_docker.git", branch: 'master' ])
			}
		}
		stage('checkout') {
			steps { 
				 sh "git checkout master"
			}
		}
		stage('Maven Clean') {
			steps {
				sh "sudo mvn clean"
			}
		}
		stage('parallel tests') {
				parallel {
					stage('Maven test') {
						steps {
							sh "mvn test /app"
						}
					}
					stage('checkstyle') {
						steps {
							sh "mvn checkstyle:checkstyle /app"
						}
						post {
							always {
                               					 step([$class: 'hudson.plugins.checkstyle.CheckStylePublisher', checkstyle: 'gitlist-PHP/build/logs/phpcs.xml'])
							}
						}
                                	}
				}
		}
		stage('Maven build') {
			steps {
				sh "mvn package /app"
			}
		}
		stage('Maven deploy') {
			steps {
				sh "mvn deploy /app"
			}
		}		
	}
}
