FROM httpd As Builder
RUN apt update 

FROM ubuntu As Deploy
RUN mkdir /app
WORKDIR /app
COPY --from=Builder /usr/local/apache2/htdocs/ .

EXPOSE 5000
CMD [ "/bin/bash" ]