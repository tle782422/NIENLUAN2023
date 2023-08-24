###sec-service-0.0.1-SNAPSHOT.jar
#FROM openjdk:17-jdk
#
## Set the working directory inside the container
#WORKDIR /app
#
## Copy the application JAR file and any other necessary files to the working directory
#COPY ./target/sec-service-0.0.1-SNAPSHOT.jar .
#
## Expose the port on which the application will run (replace <port> with the actual port number)
##EXPOSE 8082
#
## Define the command to run when the container starts
#CMD ["java", "-jar", "sec-service-0.0.1-SNAPSHOT.jar"] /false


FROM openjdk:17-jdk-alpine

RUN addgroup -S demo && adduser -S -G demo demo

USER demo

VOLUME /tmp
ADD target/sec-*.jar app.jar

ENTRYPOINT ["java", "-Djava.security.egd=file:/dev/./urandom", "-jar", "/app.jar"]