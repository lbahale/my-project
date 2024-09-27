FROM openjdk:17-jdk-alpine
WORKDIR /usr/src/app
ARG JAR_FILE=target/*.war
COPY ./target/EmployeeManagment-0.0.1-SNAPSHOT.war employeemanagment.war
EXPOSE 9091
ENTRYPOINT ["java","-jar","/employeemanagment.war"]