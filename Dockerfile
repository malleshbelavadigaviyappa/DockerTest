FROM tomcat:9.0-jre8
COPY catalina.properties  /usr/local/tomcat/conf/
COPY topla-migrate.war   /usr/local/tomcat/webapps/
COPY toplaMigrate    /usr/local/tomcat/webapps/toplaMigrate
COPY processes  /usr/local/processes
RUN mkdir /opt/localstorage
RUN processes/documentum/runRegistry.sh > nohup_register.out 2>&1 &
RUN processes/documentum/runServer.sh > nohup_server.out 2>&1 &
COPY mcf-crawler-ui.war    /usr/local/tomcat/webapps/mcf-crawler-ui.war
