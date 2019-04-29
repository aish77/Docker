
FROM ubuntu:14.04
WORKDIR /opt/java
ADD jre-8u191-linux-x64.tar.gz .
ENV JAVA_HOME /opt/java/jre1.8.0_191
ENV PATH $PATH:$JAVA_HOME/bin
WORKDIR /opt/webapp
ADD  apache-tomcat-8.5.27.tar.gz .
COPY tomcat-users.xml apache-tomcat-8.5.27/conf/
COPY context.xml apache-tomcat-8.5.27/webapps/manager/META-INF 
COPY ILP-0.0.1-20190411.192309-16.war apache-tomcat-8.5.27/webapps
EXPOSE 8080
CMD ["/opt/webapp/apache-tomcat-8.5.27/bin/catalina.sh","run"]
