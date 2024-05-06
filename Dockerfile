FROM gradle:7.3-jdk17 AS builder
COPY /src /app/src
COPY /gradle /app/gradle
COPY build.gradle gradlew settings.gradle /app/
WORKDIR /app
CMD ["./gradlew", "bootRun"]


FROM builder AS build
RUN ./gradlew build -x test

FROM eclipse-temurin:17-jre-alpine
COPY --from=build /app/build/libs/spring-petclinic-3.1.0.jar /app/app.jar
WORKDIR /app


EXPOSE 8080


CMD ["java", "-jar", "app.jar"]
