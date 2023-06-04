FROM openjdk:20
EXPOSE 8080
COPY --from=build /target/docker-demo.jar docker-demo.jar
ENTRYPOINT ["java","-jar","/docker-demo.jar"]