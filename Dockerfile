FROM openshift/origin

RUN yum update -y && yum install -y docker-io unzip telnet nmap git mysql-client lsof httpd-tools


RUN mkdir /git
# openshift training code
RUN git clone https://github.com/openshift/training /git/training
# kubernetes code
RUN git clone https://github.com/GoogleCloudPlatform/kubernetes /git/kubernetes
# utils
RUN git clone https://github.com/jim-minter/ose3-demos /git/ose3-demos
# We don't have an external load balancer in the kubernetes example
RUN sed -i 's/"createExternalLoadBalancer": true//' /git/kubernetes/examples/guestbook/frontend-service.json
# Add the user
RUN useradd osuser
RUN echo osuser:dockerinpractice | chpasswd
RUN touch /etc/openshift-passwd
# Set up password for user
RUN htpasswd -b /etc/openshift-passwd osuser dockerinpractice
COPY openshift-master-env.sh /tmp/openshift-master-env.sh
RUN cat /tmp/openshift-master-env.sh >> /etc/sysconfig/openshift-master

# set up env vars as per https://github.com/openshift/origin/tree/master/examples/sample-app
ENV KUBECONFIG /var/lib/openshift/openshift.local.certificates/admin/.kubeconfig
ENV CURL_CA_BUNDLE /var/lib/openshift/openshift.local.certificates/ca.cert.crt

# Permissions for users
RUN chmod +r /var/lib/openshift/openshift.local.certificates/admin/.kubeconfig
RUN chmod +r ./openshift.local.certificates/openshift-registry/.kubeconfig
