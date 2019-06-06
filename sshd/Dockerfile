FROM centos:7
ENV container docker
RUN (cd /lib/systemd/system/sysinit.target.wants/; for i in *; do [ $i == \
systemd-tmpfiles-setup.service ] || rm -f $i; done); \
rm -f /lib/systemd/system/multi-user.target.wants/*;\
rm -f /etc/systemd/system/*.wants/*;\
rm -f /lib/systemd/system/local-fs.target.wants/*; \
rm -f /lib/systemd/system/sockets.target.wants/*udev*; \
rm -f /lib/systemd/system/sockets.target.wants/*initctl*; \
rm -f /lib/systemd/system/basic.target.wants/*;\
rm -f /lib/systemd/system/anaconda.target.wants/*;
VOLUME [ "/sys/fs/cgroup" ]
CMD ["/usr/sbin/init"]

RUN yum install -y openssh-server openssh-client
#  ssh-keygen -A  && /usr/sbin/sshd
# RUN systemctl enable sshd

RUN yes | ssh-keygen -N "" -f ~/.ssh/id_rsa

COPY docker-entrypoint.sh /docker-entrypoint.sh

RUN chmod 777 docker-entrypoint.sh

RUN echo 123 | passwd --stdin root

ENTRYPOINT ["/docker-entrypoint.sh"]
