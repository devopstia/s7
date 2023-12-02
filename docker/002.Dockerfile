FROM ubuntu:latest
COPY keys-access /opt/keys-access
ADD ssh-ekys /opt/ssh-ekys

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


# RUN apt update
# RUN apt install vim -y
# RUN apt install unzip -y
# RUN apt install apache2 -y
# RUN cd /var/www/html && rm -rf *
# RUN cd /var/www/html wget https://warfiles-for-docker.s3.amazonaws.com/app/creative.zip 
# RUN cd /var/www/html unzip creative.zip
# RUN cd /var/www/html cp -r creative/* .
# CMD ["apachectl", "-D", "FOREGROUND"]
# # CMD ["httpd-foreground"]
# EXPOSE 80


# RUN apt update
# RUN apt install vim -y
# RUN apt install unzip -y
# RUN apt install apache2 -y
# RUN cd /var/www/html && rm -rf *
# ADD https://warfiles-for-docker.s3.amazonaws.com/app/creative.zip /var/www/html
# RUN cd /var/www/html unzip creative.zip
# RUN cd /var/www/html cp -r creative/* .
# CMD ["apachectl", "-D", "FOREGROUND"]
# # CMD ["httpd-foreground"]
# EXPOSE 80


# RUN apt update
# RUN apt install vim -y
# RUN apt install unzip -y
# RUN apt install apache2 -y
# WORKDIR /var/www/html
# RUN rm -rf *
# ADD https://warfiles-for-docker.s3.amazonaws.com/app/creative.zip .
# RUN unzip creative.zip
# RUN cp -r creative/* .
# CMD ["apachectl", "-D", "FOREGROUND"]
# # CMD ["httpd-foreground"]
# EXPOSE 80

