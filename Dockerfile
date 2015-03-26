FROM openshift/origin

RUN yum install -y docker-io unzip telnet nmap git mysql-client
RUN mkdir /git
RUN git clone https://github.com/openshift/training /git/training
RUN git clone https://github.com/GoogleCloudPlatform/kubernetes /git/kubernetes
RUN git clone https://github.com/aidanhs/dockerutil
RUN cp dockerutil/bin/* /usr/bin/local/

