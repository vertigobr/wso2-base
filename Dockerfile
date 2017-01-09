# Base CentOS 7 with a few perks
# Includes epel repo

FROM centos:7

MAINTAINER Andre Fernandes <andre@vertigo.com.br>

RUN echo "Building wso2-base..." && \
    yum update -y && \
    yum install net-tools iputils tar wget unzip epel-release git zsh tmux -y && \
    yum -y install pwgen && \
    yum clean all

RUN echo "downloading JDK from Oracle site..." && \
    wget --no-check-certificate \
         --no-cookies --header "Cookie: oraclelicense=accept-securebackup-cookie" \
	 http://download.oracle.com/otn-pub/java/jdk/7u79-b15/jdk-7u79-linux-x64.rpm -q -O /opt/jdk.rpm && \
    echo "...JDK downloaded!" && \
    yum localinstall /opt/jdk.rpm -y && \
    rm /opt/jdk.rpm && \
    yum clean all

RUN curl -sL https://download.getcarina.com/dvm/latest/install.sh | sh && \
    source /root/.dvm/dvm.sh && \
    dvm install 1.12.3
RUN echo "source /root/.dvm/dvm.sh" >> /etc/profile.d/dvm.sh
