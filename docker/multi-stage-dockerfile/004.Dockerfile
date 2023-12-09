# Stage 1: Build the Java application
FROM gradle:7.2.0-jdk11 AS build

# Set the working directory in the build stage
WORKDIR /app

# Copy the build.gradle and settings.gradle files for dependency resolution
COPY build.gradle settings.gradle ./

# Copy the src directory for the application source code
COPY src ./src

# Build the Java application using Gradle
RUN gradle build

# Stage 2: Create the production image
FROM openjdk:11-jre-slim AS production

# Set the working directory in the production stage
WORKDIR /app

# Copy the JAR file built in the previous stage
COPY --from=build /app/build/libs/myapp.jar .

# Expose port 8080 for the Java application
EXPOSE 8080

# Run the Java application
CMD ["java", "-jar", "myapp.jar"]
