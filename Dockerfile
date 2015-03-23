FROM openshift/origin

RUN yum install -y docker-io unzip telnet nmap
RUN mkdir /git
RUN cd /git
RUN git clone https://github.com/ianmiell/openshift-origin
RUN git clone https://github.com/GoogleCloudPlatform/kubernetes

