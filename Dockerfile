FROM tomcat:10.1-jdk17-corretto
COPY target/PLUMBERAPP.war /usr/local/tomcat/webapps/PLUMBERAPP.war
EXPOSE 8088
CMD ["catalina.sh", "run"]
