FROM maven:3.8.6-openjdk-17 AS build
WORKDIR /app
COPY . .
RUN mvn clean package

FROM openjdk:17-jdk
COPY --from=build /app/target/PLUMBERAPP.war /app/PlumberApp.war
EXPOSE 8088
CMD ["catalina.sh", "run"]
