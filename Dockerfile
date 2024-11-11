FROM maven:3.8.5-openjdk-17 AS build
COPY . .
RUN mvn clean package -DskipTests


FROM tomcat:10.1-jdk17-corretto
COPY --from=build target/PLUMBERAPP.jar ./PlumberApp.jar
EXPOSE 8088
CMD ["catalina.sh", "run"]