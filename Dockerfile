FROM openjdk:17-jdk-alpine
WORKDIR /usr/src/app
ARG JAR_FILE=target/*.jar
COPY /target/spring-boot-docker.war /usr/src/spring-boot-docker.war
RUN javac EmployeeManagment.java
ENTRYPOINT ["java","-jar","/usr/src/app/employeemanagment.war"]

//COPY /target/EmployeeManagment-0.0.1-SNAPSHOT.jar employeemanagment.jar
