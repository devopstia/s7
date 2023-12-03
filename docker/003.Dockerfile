## LABEL, USER
FROM ubuntu
RUN apt update

LABEL "website.name"="geeksforgeeks website"
LABEL "website.tutorial-name"="docker"
LABEL "Date"="10-08-2020"
LABEL "Create"="Tia Tia"
VOLUME /data
USER root



## ARG, ENV , VOLUME
FROM ubuntu
ARG user=jenkins
ARG group=jenkins
ARG uid=1300
ARG gid=1300
ARG http_port=8080
ARG JENKINS_HOME=/var/jenkins_home

ENV DB_PASSWORD password
ENV DB_USER admin

RUN useradd $DB_USER

RUN mkdir -p $JENKINS_HOME \
    && chown ${uid}:${gid} $JENKINS_HOME \
    && groupadd -g ${gid} ${group} \
    && useradd -d "$JENKINS_HOME" -u ${uid} -g ${gid} -s /bin/bash ${user}

VOLUME $JENKINS_HOME
USER ${user}
EXPOSE ${http_port}





















FROM ubuntu:latest

ADD https://warfiles-for-docker.s3.amazonaws.com/app/creative.zip /opt/

RUN apt update
RUN apt install wget -y
COPY creative.zip /tmp
RUN mkdir /test
RUN cd test && wget https://warfiles-for-docker.s3.amazonaws.com/app/creative.zip 

RUN apt update
RUN apt install vim -y
RUN apt install unzip -y
RUN apt install apache2 -y
WORKDIR /var/www/html
RUN rm -rf *
RUN wget https://warfiles-for-docker.s3.amazonaws.com/app/creative.zip 
RUN unzip creative.zip
RUN cp -r creative/* .

RUN wget https://warfiles-for-docker.s3.amazonaws.com/app/restaurant.zip
RUN unzip restaurant.zip
RUN rm -rf restaurant.zip

RUN wget https://warfiles-for-docker.s3.amazonaws.com/app/articles.zip
RUN unzip articles.zip
RUN rm -rf articles.zip

CMD ["apachectl", "-D", "FOREGROUND"]
# CMD ["httpd-foreground"]
EXPOSE 80