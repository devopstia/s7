# Stage 1: Build the Go application
FROM golang:1.17 AS build

# Set the working directory in the build stage
WORKDIR /app

# Copy the Go module files for dependency resolution
COPY go.mod go.sum ./

# Download and cache Go modules
RUN go mod download

# Copy the rest of the application source code
COPY . .

# Build the Go application
RUN CGO_ENABLED=0 GOOS=linux go build -o myapp

# Stage 2: Create the production image
FROM alpine:3.14

# Set the working directory in the production stage
WORKDIR /app

# Copy the built Go application from the previous stage
COPY --from=build /app/myapp .

# Expose port 8080 for the Go application
EXPOSE 8080

# Run the Go application
CMD ["./myapp"]
