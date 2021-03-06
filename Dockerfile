FROM alpine
MAINTAINER Sergey Chugay <sergey@chugay.ru>

RUN apk update \
    apk upgrade \
    apk add wget
    
ENV JAVA_HOME=/usr/java/default \
    JAVA_DIR=/usr/java/jdk-11.0.1 \
    JAVA_PKG="jdk-11.0.1_linux-x64_bin.tar.gz"

RUN mkdir -p /usr/java
RUN cd /usr/java && \
    wget -q --no-check-certificate -c --header "Cookie: oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/11.0.1+13/90cf5d8f270a4347a95050320eef3fb7/jdk-11.0.1_linux-x64_bin.tar.gz && \
    tar -xz jdk-11.0.1_linux-x64_bin.tar.gz && \
    rm -f jdk-11.0.1_linux-x64_bin.tar.gz

RUN ln -s $JAVA_DIR /usr/java/latest && \
    ln -s $JAVA_DIR /usr/java/default