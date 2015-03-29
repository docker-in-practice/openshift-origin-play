FROM openshift/origin

RUN yum update -y && yum install -y docker-io unzip telnet nmap git mysql-client lsof httpd-tools
RUN mkdir /git
RUN git clone https://github.com/openshift/training /git/training
RUN git clone https://github.com/GoogleCloudPlatform/kubernetes /git/kubernetes
RUN git clone https://github.com/aidanhs/dockerutil
RUN cp dockerutil/bin/* /usr/local/bin/
RUN useradd osuser
RUN echo osuser:dockerinpractice | chpasswd
RUN touch /etc/openshift-passwd
RUN htpasswd -b /etc/openshift-passwd osuser dockerinpractice
COPY openshift-master-env.sh /tmp/openshift-master-env.sh
RUN cat /tmp/openshift-master-env.sh >> /etc/sysconfig/openshift-master

