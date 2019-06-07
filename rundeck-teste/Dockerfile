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

#RUN  rpm -Uvh http://repo.rundeck.org/latest.rpm && \
#     yum install -y rundeck java

RUN wget https://github.com/rundeck-plugins/rundeck-winrm-plugin/releases/download/v1.3.3/rundeck-winrm-plugin-1.3.3.jar 
#RUN  mv rundeck-winrm-plugin-1.3.3.jar /usr/local/rundeck/libext/
#RUN chown -R admin:users /usr/local/rundeck

#RUN yum install -y zip
#RUN wget wget https://github.com/rundeck/rundeck-cli/releases/download/v1.1.3/rd-1.1.3.zip && \
#    unzip rd-1.1.3.zip

# https://rundeck.github.io/rundeck-cli/install/#yum-usage
RUN  wget https://bintray.com/rundeck/rundeck-rpm/rpm -O bintray.repo && \
     mv bintray.repo /etc/yum.repos.d/ && \
     yum install -y rundeck-cli

RUN yum install -y which

RUN yum install -y openssh-server openssh-client
#  ssh-keygen -A  && /usr/sbin/sshd
# RUN systemctl enable sshd

# ENV JAVA_HOME=/usr/lib/jvm/java-1.8.0-openjdk-1.8.0.212.b04-0.el7_6.x86_64/jre

COPY docker-entrypoint.sh .

RUN mkdir libext && \
    cp -rp rundeck-winrm-plugin-1.3.3.jar libext/ && \
    chown -R admin:users /usr/local/rundeck && \
    chmod -R 755 /usr/local/rundeck

RUN echo 123 | passwd --stdin root
RUN yes | ssh-keygen -N "" -f ~/.ssh/id_rsa

USER admin
WORKDIR /usr/local/rundeck
RUN yes | ssh-keygen -N "" -f ~/.ssh/id_rsa
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
