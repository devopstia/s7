# Use a base image with a specific version of Linux distribution
FROM ubuntu:20.04

# Set metadata for the image
LABEL maintainer="Your Name <your@email.com>"
LABEL description="A strong Dockerfile example showcasing various instructions."

# Set environment variables
ENV APP_HOME=/usr/src/app
ENV NODE_VERSION=14

# Set the working directory inside the container
WORKDIR $APP_HOME

# Copy necessary files into the container
COPY . .

# Install dependencies and necessary packages
RUN apt-get update && \
    apt-get install -y \
    build-essential \
    curl \
    git \
    wget \
    && apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Install Node.js (for example)
RUN curl -fsSL https://deb.nodesource.com/setup_${NODE_VERSION}.x | bash - && \
    apt-get install -y nodejs && \
    node -v && \
    npm -v

# Set up the application - Build, compile, or install application-specific requirements
RUN npm install --production

# Expose ports
EXPOSE 3000

# Define a volume