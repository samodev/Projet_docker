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
				sh "/usr/local/maven/bin/mvn clean -f app/"
			}
		}
		stage('parallel tests') {
				parallel {
					stage('Maven test') {
						steps {
							sh "/usr/local/maven/bin/mvn test /app"
						}
					}
					stage('checkstyle') {
						steps {
							sh "/usr/local/maven/bin/mvn checkstyle:checkstyle /app"
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
				sh "/usr/local/maven/bin/mvn package /app"
			}
		}
		stage('Maven deploy') {
			steps {
				sh "/usr/local/maven/bin/mvn deploy /app"
			}
		}		
	}
}
