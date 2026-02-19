FROM ubuntu
MAINTAINER Carlos Badenes-Olmedo <carlos.badenes@upm.es>

RUN apt-get update
RUN apt-get install -y openjdk-8-jdk curl
RUN apt-get clean
RUN java -version

# Fix certificate issues
RUN apt-get update && \
    apt-get install ca-certificates-java && \
    apt-get clean && \
    update-ca-certificates -f;

RUN mkdir /opt/tomcat
WORKDIR /opt/tomcat

RUN curl -O https://downloads.apache.org/tomcat/tomcat-9/v9.0.115/bin/apache-tomcat-9.0.115.tar.gz

RUN tar zxvf apache*.tar.gz
RUN mv apache-tomcat-9.0.115/* /opt/tomcat/.

WORKDIR /opt/tomcat/webapps
RUN curl -O -L https://tomcat.apache.org/tomcat-7.0-doc/appdev/sample/sample.war

EXPOSE 8080

CMD ["/opt/tomcat/bin/catalina.sh", "run"]

