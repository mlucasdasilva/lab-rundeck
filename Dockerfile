FROM centos:centos7

RUN yum update -y && yum update -y
RUN yum install -y java-1.8.0-openjdk 
RUN yum install -y wget
RUN mkdir /usr/local/rundeck/
WORKDIR /usr/local/rundeck
#RUN wget -c http://dl.bintray.com/rundeck/rundeck-maven/rundeck-launcher-2.5.3.jar
RUN wget -c https://dl.bintray.com/rundeck/rundeck-maven/rundeck-3.0.20-20190408.war
RUN useradd -g users -m -s /bin/bash admin
RUN chown -R admin:users /usr/local/rundeck

RUN wget https://github.com/rundeck-plugins/rundeck-winrm-plugin/releases/download/v1.3.3/rundeck-winrm-plugin-1.3.3.jar 
#RUN  mv rundeck-winrm-plugin-1.3.3.jar /usr/local/rundeck/libext/
#RUN chown -R admin:users /usr/local/rundeck

COPY docker-entrypoint.sh .

RUN mkdir libext && \
    cp -rp rundeck-winrm-plugin-1.3.3.jar libext/ && \
    chown -R admin:users /usr/local/rundeck && \
    chmod -R 755 /usr/local/rundeck


#RUN  rpm -Uvh http://repo.rundeck.org/latest.rpm && \
#     yum install rundeck java


USER admin
WORKDIR /usr/local/rundeck
#RUN   java -jar rundeck-3.0.20-20190408.war --installonly

ENTRYPOINT ["/usr/local/rundeck/docker-entrypoint.sh"]
#CMD ["java","-jar","rundeck-launcher-2.5.3.jar"]
#CMD ["java","-jar","rundeck-3.0.20-20190408.war"]
CMD ["java","-jar rundeck-3.0.20-20190408.war"]
#CMD java -Xmx4g -jar rundeck-3.0.20-20190408.war
#CMD java -jar rundeck-3.0.20-20190408.war
# The CMD instruction has three forms:
#    CMD ["executable","param1","param2"] (exec form, this is the preferred form)
#    CMD ["param1","param2"] (as default parameters to ENTRYPOINT)
#    CMD command param1 param2 (shell form)


#VOLUME ["/home/rundeck/server/data"]

EXPOSE 4440
