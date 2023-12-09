# Stage 1: Build the Java application
FROM maven:3.8.4-openjdk-11 AS build

# Set the working directory in the build stage
WORKDIR /app

# Copy the pom.xml file to resolve dependencies
COPY pom.xml .

# Copy the rest of the application source code
COPY src ./src

# Build the Java application using Maven
RUN mvn clean package

# Stage 2: Create the production image
FROM openjdk:11-jre-slim AS production

# Set the working directory in the production stage
WORKDIR /app

# Copy the JAR file built in the previous stage
COPY --from=build /app/target/myapp.jar .

# Expose port 8080 for the Java application
EXPOSE 8080

# Run the Java application
CMD ["java", "-jar", "myapp.jar"]
