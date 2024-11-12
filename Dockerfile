FROM maven:3.8.8-openjdk-17-slim AS buildWORKDIR /app
COPY . .
RUN mvn clean package

FROM openjdk:17-jdk-slim
COPY --from=build /app/target/PLUMBERAPP.war /app/PlumberApp.war
EXPOSE 8088
CMD ["catalina.sh", "run"]
