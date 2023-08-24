#FROM openjdk:17-jdk-alpine
#VOLUME /tmp
#ADD ./target/customer-service-0.0.1-SNAPSHOT.jar app.jar
#RUN sh -c 'touch /app.jar'
#ENV JAVA_OPTS=""
#ENTRYPOINT [ "sh", "-c", "java $JAVA_OPTS -Djava.security.egd=file:/dev/./urandom -jar /app.jar" ]


FROM openjdk:17-jdk-alpine

RUN addgroup -S demo && adduser -S -G demo demo

USER demo

VOLUME /tmp
ADD target/auth-jwt-*.jar app.jar

ENTRYPOINT ["java", "-Djava.security.egd=file:/dev/./urandom", "-jar", "/app.jar"]