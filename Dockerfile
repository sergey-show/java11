FROM alpine
MAINTAINER Sergey Chugay <sergey@chugay.ru>

RUN apk update \
    apk upgrade \
    apk add wget

ENV JAVA_HOME=/usr/java/default \
    JAVA_WORK=/usr/java \
    JAVA_PKG="jdk-11.0.1_linux-x64_bin.tar.gz"

RUN cd /tmp && \
    wget -q --no-check-certificate -c --header "Cookie: oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/11.0.1+13/90cf5d8f270a4347a95050320eef3fb7/jdk-11.0.1_linux-x64_bin.tar.gz && \
    mkdir -p /usr/java && \
    cd /usr/java && \
    tar -xf /tmp/jdk-11.0.1_linux-x64_bin.tar.gz && \
    rm -f /tmp/jdk-11.0.1_linux-x64_bin.tar.gz && \
    export JAVA_DIR=$(ls -1 -d /usr/java/*) && \
    ln -s $JAVA_DIR /usr/java/latest && \
    ln -s $JAVA_DIR /usr/java/default && \
    alternatives --install /usr/bin/java java $JAVA_DIR/bin/java 20000 && \
    alternatives --install /usr/bin/javac javac $JAVA_DIR/bin/javac 20000 && \
    alternatives --install /usr/bin/jar jar $JAVA_DIR/bin/jar 20000

