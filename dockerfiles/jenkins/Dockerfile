FROM centos:latest

RUN yum update -y && yum install -y sudo wget java-1.8.0-openjdk java-1.8.0-openjdk-devel ansible git

RUN useradd jenkins && \
    echo "jenkins" | passwd --stdin jenkins

RUN  sudo wget http://apache.mirrors.ovh.net/ftp.apache.org/dist/maven/maven-3/3.5.4/binaries/apache-maven-3.5.4-bin.tar.gz

RUN sudo tar xzf apache-maven-3.5.4-bin.tar.gz

RUN sudo mv apache-maven-3.5.4 /usr/local/maven

RUN sudo rm -rf /apache-maven-3.5.4-bin.tar.gz

ENV JAVA_HOME /usr/lib/jvm/java-1.8.0/

RUN sudo touch /etc/profile.d/maven.sh

RUN sudo echo $'export M2_HOME=/usr/local/maven \n\
export PATH=${M2_HOME}/bin:${PATH}' > /etc/profile.d/maven.sh

RUN source /etc/profile.d/maven.sh

ADD http://mirrors.jenkins.io/war-stable/latest/jenkins.war /opt/

CMD exec /usr/bin/java -jar /opt/jenkins.war

EXPOSE 8080



