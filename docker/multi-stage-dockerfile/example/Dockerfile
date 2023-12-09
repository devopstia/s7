FROM ubuntu:latest As Builder

RUN apt update
RUN apt install vim -y
RUN apt install unzip -y
RUN apt install wget -y

RUN mkdir /app
WORKDIR /app

RUN wget https://warfiles-for-docker.s3.amazonaws.com/app/creative.zip 
RUN unzip creative.zip
RUN cp -r creative/* .
RUN rm -rf creative.zip

RUN wget https://warfiles-for-docker.s3.amazonaws.com/app/restaurant.zip
RUN unzip restaurant.zip
RUN rm -rf restaurant.zip

RUN wget https://warfiles-for-docker.s3.amazonaws.com/app/articles.zip
RUN unzip articles.zip
RUN rm -rf articles.zip

FROM httpd:latest
WORKDIR /usr/local/apache2/htdocs/
RUN rm -rf *
COPY --from=Builder /app /usr/local/apache2/htdocs/
CMD ["apachectl", "-D", "FOREGROUND"]
EXPOSE 80