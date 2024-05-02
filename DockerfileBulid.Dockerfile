FROM ubuntu:latest as build
RUN apt-get install -y wget unzip openjdk-17-jdk
COPY /src /app/src
COPY /gradle /app/gradle
COPY build.gradle gradlew settings.gradle /app/
WORKDIR /app
RUN ./gradlew build -x test
FROM eclipse-temurin:17-jre-alpine
WORKDIR /usr/local
RUN wget https://services.gradle.org/distributions/gradle-7.4-bin.zip
RUN unzip gradle-7.4-bin.zip
ENV PATH=$PATH:/usr/local/gradle-7.4/bin
WORKDIR /app


EXPOSE 8080


CMD ["java", "-jar", "app.jar"]

