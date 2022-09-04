FROM openjdk:8
ARG JAR_FILE=target/*.jar
COPY ${JAR_FILE} devops-integration.jar
ENTRYPOINT ["java","-jar","/devops-integration.jar"]
