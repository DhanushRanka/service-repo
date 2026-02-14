FROM maven:3.9.6-eclipse-temurin-17 AS builder
WORKDIR /app
COPY . /app
RUN mvn clean package


FROM  eclipse-temurin:17-jre
WORKDIR /app
COPY --from=builder /app/target/*.jar test.jar
CMD [ "java", "-jar", "/app/test.jar" ]