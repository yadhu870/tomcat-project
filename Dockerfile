FROM openjdk:8 AS BUILD_IMAGE
RUN apt update && apt install maven -y
RUN git clone https://github.com/yadhu870/tomcat-project.git
RUN cd tomcat-project && mvn install

FROM tomcat:8-jre11

#remove default 
RUN rm -rf /usr/local/tomcat/webapps/*

#copy build 
COPY --from=BUILD_IMAGE tomcat-project/target/webapp.war /usr/local/tomcat/webapps/webapp.war


EXPOSE 8080
CMD ["catalina.sh", "run"]
