FROM alpine
MAINTAINER Sergey Chugay <sergey@chugay.ru>

RUN apk update \
    apk upgrade \
    apk add wget
    
ENV JAVA_HOME=/usr/java/default \
    JAVA_PKG="jdk-11.0.1_linux-x64_bin.tar.gz"

RUN mkdir -p /usr/java 
RUN cd /usr/java 
RUN wget -q --no-check-certificate -c --header "Cookie: oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/11.0.1+13/90cf5d8f270a4347a95050320eef3fb7/jdk-11.0.1_linux-x64_bin.tar.gz
RUN tar -xzf jdk-11.0.1_linux-x64_bin.tar.gz -C /usr/java
RUN export JAVA_DIR=$(ls -1 -d /usr/java/*) 
RUN ln -s /usr/java/jdk-11.0.1  /usr/java/latest 
RUN ln -s /usr/java/jdk-11.0.1 /usr/java/default 
RUN alternatives --install /usr/bin/java java /usr/java/jdk-11.0.1/bin/java 20000
RUN alternatives --install /usr/bin/javac javac /usr/java/jdk-11.0.1/bin/javac 20000 
RUN alternatives --install /usr/bin/jar jar /usr/java/jdk-11.0.1/bin/jar 20000