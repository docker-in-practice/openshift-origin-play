FROM openshift/origin

RUN yum update -y && yum install -y docker-io unzip telnet nmap git mysql-client
RUN mkdir /git
RUN git clone https://github.com/openshift/training /git/training
RUN git clone https://github.com/GoogleCloudPlatform/kubernetes /git/kubernetes
RUN git clone https://github.com/aidanhs/dockerutil
RUN cp dockerutil/bin/* /usr/local/bin/
RUN useradd osuser
RUN echo osuser:dockerinpractice | chpasswd

