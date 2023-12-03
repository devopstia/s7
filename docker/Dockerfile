FROM ubuntu
RUN apt update
RUN apt install unzip -y 
RUN apt install wget -y 
RUN apt install vim -y 
RUN apt install tree -y 
RUN apt install curl -y 

## ========================================

FROM ubuntu
RUN apt update
RUN apt install unzip -y \
    wget \
    vim \
    tree \
    curl 

## ========================================

FROM ubuntu
RUN apt update
RUN mkdir /http
RUN touch /http/test.txt
RUN useradd tom
RUN groupadd admin
RUN usermod -aG admin tom

## ========================================

FROM ubuntu
RUN apt update && \
    mkdir /http && \
    touch /http/test.txt && \
    useradd tom && \
    groupadd admin && \
    usermod -aG admin tom

## ========================================

FROM ubuntu
RUN apt update && \
    apt install -y unzip  \
    wget \
    vim \
    tree \
    curl && \
    mkdir /http && \
    touch /http/test.txt && \
    useradd tom && \
    groupadd admin && \
    usermod -aG admin tom

## ========================================

FROM ubuntu
ENV DB_USERNAME=admin
ENV DB_PASSWORD=password
ARG USERNAME=tom
ARG GROUP=admin
ARG PACKAGE_MANAGER=apt
RUN ${PACKAGE_MANAGER} update && \
    ${PACKAGE_MANAGER} install -y unzip  \
    wget \
    vim \
    tree \
    curl && \
    mkdir /http && \
    touch /http/test.txt && \
    useradd ${USERNAME} && \
    groupadd ${GROUP} && \
    usermod -aG ${GROUP} ${USERNAME} 

## ========================================

FROM ubuntu:latest
ARG PORT=80

RUN apt update && \
    apt install -y vim  \
    unzip \
    apache2 

WORKDIR /var/www/html

RUN rm -rf * && \
    wget https://warfiles-for-docker.s3.amazonaws.com/app/creative.zip && \
    unzip creative.zip && \
    cp -r creative/* . && \
    wget https://warfiles-for-docker.s3.amazonaws.com/app/restaurant.zip && \
    unzip restaurant.zip && \
    rm -rf restaurant.zip && \
    wget https://warfiles-for-docker.s3.amazonaws.com/app/articles.zip && \
    unzip articles.zip && \
    rm -rf articles.zip

CMD ["apachectl", "-D", "FOREGROUND"]
# CMD ["httpd-foreground"]
EXPOSE ${PORT}

## ========================================

FROM ubuntu:latest
RUN apt update && \
    useradd -m tom && \
    groupadd admin && \
    usermod -aG admin tom

USER tom
WORKDIR /student_home

## ========================================
FROM ubuntu:latest

ARG WEB=creative

RUN apt update
RUN apt install vim -y
RUN apt install unzip -y
RUN apt install wget -y
RUN apt install apache2 -y
WORKDIR /var/www/html
RUN rm -rf *
RUN wget https://warfiles-for-docker.s3.amazonaws.com/app/${WEB}.zip 
RUN unzip ${WEB}.zip
RUN cp -r ${WEB}/* .

EXPOSE 80
CMD ["apachectl", "-D", "FOREGROUND"]

## ========================================

FROM ubuntu:latest
RUN apt update
RUN apt install apache2 -y
WORKDIR /var/www/html
COPY . .

## ========================================

FROM ubuntu:latest
WORKDIR /tia
COPY . .

## ========================================
ARG VERSION=1.21
FROM golang:${VERSION}