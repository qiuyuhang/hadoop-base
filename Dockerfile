FROM ubuntu

MAINTAINER qiuyuhang <imqyh@qq.com>

WORKDIR /root

# install openssh-server, openjdk and wget

RUN apt update && apt install -y openssh-server openjdk-8-jdk wget nano --fix-missing

# install hadoop 3.0.0
RUN wget http://apache.org/dist/hadoop/common/hadoop-3.0.0/hadoop-3.0.0.tar.gz && \
    tar -xzvf hadoop-3.0.0.tar.gz && \
    mv hadoop-3.0.0 /opt/hadoop && \
    rm hadoop-3.0.0.tar.gz

# install hive 2.3.2
RUN wget http://apache.org/dist/hive/hive-2.3.2/apache-hive-2.3.2-bin.tar.gz && \
    tar -xzvf apache-hive-2.3.2-bin.tar.gz && \
    mv apache-hive-2.3.2-bin /opt/hive && \
    rm apache-hive-2.3.2-bin.tar.gz

# install hive-mysql driver
RUN wget https://dev.mysql.com/get/Downloads/Connector-J/mysql-connector-java-5.1.45.tar.gz && \
    tar -xzvf mysql-connector-java-5.1.45.tar.gz && \
     mv mysql-connector-java-5.1.45/mysql-connector-java-5.1.45-bin.jar /opt/hive/lib/ && \
    rm -rf mysql-connector-java-5.1.45*
    
# install zookeeper 3.4.11
RUN wget http://apache.org/dist/zookeeper/zookeeper-3.4.11/zookeeper-3.4.11.tar.gz && \
    tar -xzvf zookeeper-3.4.11.tar.gz && \
    mv zookeeper-3.4.11 /opt/zookeeper && \
    rm zookeeper-3.4.11.tar.gz

# set environment variable
ENV JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64 
ENV HADOOP_HOME=/opt/hadoop
ENV HIVE_HOME=/opt/hive 
ENV ZK_HOME=/opt/zookeeper 
ENV PATH=$PATH:/opt/hadoop/bin:/opt/hadoop/sbin:/opt/hive/bin:/opt/zookeeper/bin
