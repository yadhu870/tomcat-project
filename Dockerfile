FROM tomcat:latest
COPY webapp/target/webapp.war /usr/local/tomcat/webapps
RUN cp -r /usr/local/tomcat/webapps.dist/* /usr/local/tomcat/webapps
EXPOSE 8080

# Start the Tomcat server
CMD ["catalina.sh", "run"]
