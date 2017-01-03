# Base CentOS 7 with a few perks
# Includes epel repo

FROM centos:7

MAINTAINER Andre Fernandes <andre@vertigo.com.br>

RUN echo "Building wso2-base..." && \
    yum update -y && \
    yum install net-tools iputils tar wget unzip epel-release -y && \
    yum -y install pwgen && \
    yum clean all
