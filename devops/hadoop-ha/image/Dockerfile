FROM openjdk:8-jdk-slim-bullseye
LABEL org.opencontainers.image.authors="lancelot_zhu@163.com"

ENV HADOOP_VERSION 3.3.6
ENV HADOOP_HOME=/opt/hadoop

ENV HADOOP_COMMON_HOME=${HADOOP_HOME} \
    HADOOP_HDFS_HOME=${HADOOP_HOME} \
    HADOOP_MAPRED_HOME=${HADOOP_HOME} \
    HADOOP_YARN_HOME=${HADOOP_HOME} \
    HADOOP_CONF_DIR=${HADOOP_HOME}/etc/hadoop \
    PATH=${PATH}:${HADOOP_HOME}/bin

#run update
RUN sed -i "s@http://\(deb\|security\).debian.org@http://mirrors.aliyun.com@g" /etc/apt/sources.list
RUN apt update \
    && apt -y install curl \
    && apt -y install openssh-server \
    && rm -rf /var/lib/apt/lists/*

# download hadoop
RUN curl --silent --output /tmp/hadoop.tgz https://mirrors.tuna.tsinghua.edu.cn/apache/hadoop/core/hadoop-${HADOOP_VERSION}/hadoop-${HADOOP_VERSION}.tar.gz && tar --directory /opt -xzf /tmp/hadoop.tgz && rm /tmp/hadoop.tgz

RUN ln -s /opt/hadoop-${HADOOP_VERSION} ${HADOOP_HOME}

# generate ssh key
RUN ssh-keygen -t rsa -f /root/.ssh/id_rsa -N ''
RUN cat /root/.ssh/id_rsa.pub > /root/.ssh/authorized_keys

WORKDIR $HADOOP_HOME

# Hdfs ports
EXPOSE 50010 50020 50070 50075 50090 8020 9000 9870

# Mapred ports
EXPOSE 19888

#Yarn ports
EXPOSE 8030 8031 8032 8033 8040 8042 8088

#Other ports
EXPOSE 49707 2122
