# Set the base image
FROM ubuntu:20.04

# Add labels to the image for metadata
LABEL version="1.0"
LABEL description="Sample Dockerfile with instructions"

# Set the maintainer information
LABEL Name="John Doe" 
LABEL Email="johndoe@example.com"

# Add a file from the host to the container's file system
ADD myapp.tar.gz /opt/myapp

# Copy files/directories from the host to the container
COPY config.ini /opt/myapp/config.ini

# Set the default command to run when the container starts
CMD ["/opt/myapp/start.sh"]

# Set the default entry point for the container
ENTRYPOINT ["/opt/myapp/entrypoint.sh"]

# Set environment variables
ENV APP_ENV=production
ENV DB_HOST=localhost
ENV DB_PORT=3306

# Expose a port for communication
EXPOSE 8080

# Run a shell command during build
RUN apt-get update && apt-get install -y curl

# Set the user that the image should run as
USER appuser

# Create a volume
VOLUME /var/data

# Set the working directory inside the container
WORKDIR /opt/myapp

# Define an argument
ARG build_version=1.0
