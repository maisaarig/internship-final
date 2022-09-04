FROM openjdk:8
ARG JAR_FILE=target/*.war
COPY ${JAR_FILE} devops-integration.war
ENTRYPOINT ["java","-jar","/devops-integration.war"]
