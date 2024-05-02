FROM gradle:jdk17 as build
COPY /src /app/src
COPY /gradle /app/gradle
COPY build.gradle gradlew settings.gradle /app/
WORKDIR /app
RUN ./gradlew build -x test
FROM eclipse-temurin:17-jre-alpine
WORKDIR /app


EXPOSE 8080


CMD ["java", "-jar", "app.jar"]

