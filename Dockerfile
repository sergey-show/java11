FROM alpine
MAINTAINER Sergey Chugay <sergey@chugay.ru>

RUN apk update \
    apk upgrade \
    apk add wget
    
ENV JAVA_HOME=/usr/java/default \
    JAVA_PKG="jdk-11.0.1_linux-x64_bin.tar.gz"

RUN mkdir -p /usr/java && \
    cd /usr/java && \
    wget -q --no-check-certificate -c --header "Cookie: oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/11.0.1+13/90cf5d8f270a4347a95050320eef3fb7/jdk-11.0.1_linux-x64_bin.tar.gz && \
    tar -xzf jdk-*.tar.gz -C /usr/java && \
    export JAVA_DIR=$(ls -1 -d /usr/java/*) && \
    ln -s $JAVA_DIR /usr/java/latest && \
    ln -s $JAVA_DIR /usr/java/default