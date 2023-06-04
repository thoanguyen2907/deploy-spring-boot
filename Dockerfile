#
# Build stage
#
FROM maven:3.8.2-openjdk-17 AS build
COPY . .
RUN mvn clean package -DskipTests

#
# Package stage
#
FROM openjdk:17-jdk-slim
COPY --from=build /target/docker-demoT.jar docker-demo.jar
EXPOSE 8080
ENTRYPOINT ["java","-jar","docker-demo"]