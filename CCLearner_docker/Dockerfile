FROM ubuntu:14.04

SHELL ["/bin/bash", "-c"]
ENV DEBIAN_FRONTEND=noninteractive

RUN apt update && apt-get update
RUN apt install -y 
RUN apt install -y procps vim wget unzip curl gnupg git
RUN apt install -y sudo
RUN apt install -y software-properties-common

# Install OpenJDK-8
# RUN add-apt-repository -y ppa:openjdk-r/ppa
# RUN apt update
# RUN apt install -y openjdk-8-jdk

# Install OracleJDK-8
COPY ./OracleJDK/jdk-8u271-linux-x64.tar.gz /
RUN mkdir -p /usr/lib/jvm
WORKDIR /usr/lib/jvm
RUN tar xfo /jdk-8u271-linux-x64.tar.gz
RUN ln -s jdk1.8.0_271 java-8-oracle-amd64

RUN apt install -y gradle

RUN wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -
RUN sudo sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt/ $(lsb_release -sc)-pgdg main" > /etc/apt/sources.list.d/PostgreSQL.list'
RUN apt update

ARG POSTGRE_VERSION="10"

RUN apt install -y postgresql-${POSTGRE_VERSION}
RUN apt install -y postgresql-contrib-${POSTGRE_VERSION}
RUN apt install -y pgadmin3

# sudo user settings

ENV LANG="C.UTF-8" \ 
    LANGUAGE=$LANG

ARG username=cclearner
ARG wkdir=/home/cclearner/Desktop/

RUN echo "root:root" | chpasswd && \
    adduser --disabled-password --gecos "" "${username}" && \
    echo "${username}:${username}" | chpasswd && \
    echo "%${username}    ALL=(ALL)   NOPASSWD:    ALL" >> /etc/sudoers

WORKDIR ${wkdir}
RUN chown ${username}:${username} ${wkdir}
USER ${username}

RUN echo 'export JAVA_HOME=/usr/lib/jvm/java-8-oracle-amd64' >> /home/cclearner/.bashrc
RUN echo 'export PATH=${JAVA_HOME}/bin:${PATH}' >> /home/cclearner/.bashrc
