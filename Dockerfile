# Trusty 
FROM ubuntu:14.04

MAINTAINER Ron Kurr <kurr@kurron.org>

# Install JDK 7 
RUN apt-get --quiet update && \
    apt-get --quiet --yes install wget && \
    apt-get clean && \
    wget --quiet \
         --output-document=/jdk-7.tar.gz \
         --no-check-certificate \
         --no-cookies \
         --header "Cookie: oraclelicense=accept-securebackup-cookie" \
         http://download.oracle.com/otn-pub/java/jdk/7u79-b15/jdk-7u79-linux-x64.tar.gz && \
    mkdir -p /usr/lib/jvm && \
    tar --gunzip --extract --verbose --file /jdk-7.tar.gz --directory /usr/lib/jvm && \
    rm -f /jdk-7.tar.gz && \
    chown -R root:root /usr/lib/jvm

# set the environment variables 
ENV JDK_HOME /usr/lib/jvm/jdk1.7.0_79 
ENV JAVA_HOME /usr/lib/jvm/jdk1.7.0_79
ENV PATH $PATH:$JAVA_HOME/bin

# export meta-data about this container
ENV KURRON_JAVA_VENDOR Oracle 
ENV KURRON_JAVA_VERSION 1.7.0_79 


