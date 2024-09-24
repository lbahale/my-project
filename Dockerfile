# Use a multi-stage build to create a lightweight final image

# First stage: Build the application
FROM maven:3.8.4-openjdk-11-slim AS build

# Set the working directory
WORKDIR /app

# Copy the Maven POM file and the source code
COPY pom.xml ./
COPY src ./src

# Build the application
RUN mvn clean package -DskipTests

# Second stage: Create a smaller runtime image
FROM openjdk:11-jre-slim

# Set the working directory
WORKDIR /app

# Copy the JAR file from the first stage
COPY --from=build /app/target/*.jar app.jar

# Expose the application port (default for Spring Boot)
EXPOSE 8080

# Run the application
ENTRYPOINT ["java", "-jar", "app.jar"]


