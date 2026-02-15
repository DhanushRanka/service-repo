FROM maven:3.9.0-eclipse-temurin-17 AS builder
WORKDIR /app

ARG NEXUS_USER
ARG NEXUS_PASS

COPY . /app
# Install envsubst (if not present)
RUN apt-get update && apt-get install -y gettext-base

COPY settings.xml /root/.m2/settings.xml
RUN envsubst < settings.xml > /root/.m2/settings.xml


RUN mvn clean package -s /root/.m2/settings.xml


FROM  eclipse-temurin:17-jre
WORKDIR /app
COPY --from=builder /app/target/*.jar test.jar
CMD [ "java", "-jar", "/app/test.jar" ]