FROM maven:3.8.2-openjdk-20 AS build
COPY . .
RUN mvn clean package -DskipTests


FROM openjdk:20
EXPOSE 8080
COPY --from=build /target/docker-demo.jar docker-demo.jar
ENTRYPOINT ["java","-jar","/docker-demo.jar"]