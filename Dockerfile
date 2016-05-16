FROM java:8

MAINTAINER David Herrmann <davherrmann@gmail.com>

# install maven
RUN wget http://ftp.fau.de/apache/maven/maven-3/3.3.1/binaries/apache-maven-3.3.1-bin.tar.gz
RUN tar -zxvf apache-maven-3.3.1-bin.tar.gz
RUN rm apache-maven-3.3.1-bin.tar.gz
RUN mv apache-maven-3.3.1 /usr/lib/mvn

# set environment variables
ENV M2_HOME=/usr/lib/mvn
ENV M2=$M2_HOME/bin
ENV PATH $PATH:$M2_HOME:$M2

# attach volumes
VOLUME /volume/git

# create working directory
RUN mkdir -p /local/git
WORKDIR /local/git

# run terminal
CMD ["/bin/bash"]
