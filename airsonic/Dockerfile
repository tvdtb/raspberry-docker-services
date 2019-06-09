FROM ubuntu:19.10

EXPOSE 8080

RUN adduser -q --no-create-home --uid 1000 --disabled-password --disabled-login airsonic                          && \
    mkdir /var/airsonic/                                                                                          && \ 
    chown -R airsonic:airsonic /var/airsonic                                                                      && \
    echo created user airsonic 

RUN apt update                                                  && \
    apt install -y openjdk-8-jre-headless=8u212-b03-0ubuntu1    && \
    apt install -y wget gpg unzip curl vim                      && \
    apt install -y ffmpeg                                       && \
    apt clean                                                   && \
    echo java is installed

RUN wget -q -O /opt/tomcat.tgz http://mirror.dkd.de/apache/tomcat/tomcat-8/v8.5.41/bin/apache-tomcat-8.5.41.tar.gz && \
    tar xzf /opt/tomcat.tgz --directory /opt                                                                    && \
    mv /opt/apache*tom* /opt/tomcat                                                                             && \
    chown -R airsonic:airsonic /opt/tomcat                                                                      && \
    rm -rf /opt/tomcat.tgz /opt/tomcat/webapps/*                                                                && \
    echo tomcat installed 

RUN wget -q -O /opt/airsonic.war https://github.com/airsonic/airsonic/releases/download/v10.3.1/airsonic.war   && \
    gpg --keyserver keyserver.ubuntu.com --recv 0A3F5E91F8364EDF                                               && \
    wget -q -O /opt/airsonic.war.asc https://github.com/airsonic/airsonic/releases/download/v10.3.1/airsonic.war.asc && \
    gpg --verify /opt/airsonic.war.asc                                                                            && \
    unzip -d /opt/tomcat/webapps/airsonic /opt/airsonic.war                                                       && \
    curl -o /tmp/mysql.tar --location "https://dev.mysql.com/get/Downloads/Connector-J/mysql-connector-java-8.0.16.tar.gz"  && \
    tar xf /tmp/mysql.tar -C /tmp                                                                                           && \
    mv $(find /tmp/mysql-connector-java-8.0.16 -name *.jar) /opt/tomcat/lib/                                                && \
    rm -rf /tmp/mysql*                                                                                                      && \
    chown -R airsonic:airsonic /opt/tomcat/webapps/airsonic                                                       && \
    rm -rf /opt/airsonic.war                                                                                      && \
    echo airsonic installed
    

VOLUME /var/airsonic
VOLUME /opt/tomcat/logs

USER airsonic

CMD sh /opt/tomcat/bin/catalina.sh run
