FROM openshift/origin

RUN yum install -y docker-io unzip telnet nmap git
RUN mkdir /git
RUN git clone https://github.com/openshift/training /git/training
RUN git clone https://github.com/GoogleCloudPlatform/kubernetes /git/kubernetes

