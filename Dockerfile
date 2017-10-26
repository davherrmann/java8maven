FROM java:8

MAINTAINER David Herrmann <davherrmann@gmail.com>

# install maven
ENV MAVEN_VERSION 3.5.2
ENV M2_HOME "/usr/local/apache-maven/apache-maven-${MAVEN_VERSION}"
RUN wget --quiet "http://mirror.dkd.de/apache/maven/maven-3/${MAVEN_VERSION}/binaries/apache-maven-${MAVEN_VERSION}-bin.tar.gz" && \
  mkdir -p /usr/local/apache-maven && \
  mv "apache-maven-${MAVEN_VERSION}-bin.tar.gz" /usr/local/apache-maven && \
  tar xzvf "/usr/local/apache-maven/apache-maven-${MAVEN_VERSION}-bin.tar.gz" -C /usr/local/apache-maven/ && \
  update-alternatives --install /usr/bin/mvn mvn "${M2_HOME}/bin/mvn" 1 && \
  update-alternatives --config mvn

# set maven opts
ENV MAVEN_OPTS "-Xms512m -Xmx2g"

# attach volumes
VOLUME /volume/ws

# create working directory
RUN mkdir -p /local/ws
WORKDIR /local/ws
