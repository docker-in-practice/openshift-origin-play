FROM openshift/origin

RUN yum install -y docker unzip
RUN wget https://blog.openshift.com/wp-content/uploads/blog_part1_files.zip
RUN unzip blog_part1_files.zip
RUN sh ./pullimages.sh

