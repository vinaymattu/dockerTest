 FROM openjdk:17-ea-slim-buster
 ADD target/*.jar app.jar
 EXPOSE 9000
 ENTRYPOINT ["sh", "-c", "java -jar /app.jar"]