# Use the official OpenJDK image as the base image
#FROM openjdk:17-jdk
#
## Set the working directory inside the container
#WORKDIR /app
#
## Copy the application JAR file and any other necessary files to the working directory
#COPY ./target/gateway-0.0.1-SNAPSHOT.jar .
#
## Expose the port on which the application will run (replace <port> with the actual port number)
##EXPOSE 8888
#
## Define the command to run when the container starts
#CMD ["java", "-jar", "gateway-0.0.1-SNAPSHOT.jar"] //false

FROM openjdk:17-jdk-alpine

RUN addgroup -S demo && adduser -S -G demo demo

USER demo

VOLUME /tmp
ADD target/gateway-*.jar app.jar

ENTRYPOINT ["java", "-Djava.security.egd=file:/dev/./urandom", "-jar", "/app.jar"]