### Set the base image
FROM jboss/base-jdk:8

### File Author / Maintainer
MAINTAINER "Ramon Morales" "<karkul@gmail.com"

USER root

### Set the workdir
WORKDIR /opt/jboss

### Install EAP 7.2.0
ADD jboss-eap-7.2.0.zip /opt/jboss
RUN unzip /opt/jboss/jboss-eap-7.2.0.zip

### You can download the JBoss zip file from
# https://developers.redhat.com/products/eap/download 
# put in the same directory where is your Dockerfile

### Set environment
ENV JBOSS_HOME  /opt/jboss/jboss-eap-7.2

### Create EAP user
RUN $JBOSS_HOME/bin/add-user.sh admin Passw0rd! --silent

EXPOSE 8080 9990 9999

CMD ["/opt/jboss/jboss-eap-7.2/bin/standalone.sh","-b","0.0.0.0","-bmanagement","0.0.0.0"]
