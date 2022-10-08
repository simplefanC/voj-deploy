FROM ubuntu:18.04

ARG DEBIAN_FRONTEND=noninteractive

ENV TZ=Asia/Shanghai

RUN buildDeps='software-properties-common libtool wget unzip' && \
    apt-get update && apt-get install -y python python3.7 gcc g++ mono-devel $buildDeps curl bash && \
    add-apt-repository ppa:openjdk-r/ppa && add-apt-repository ppa:longsleep/golang-backports && apt-get update && apt-get install -y golang-go openjdk-11-jdk && \
    apt-get purge -y --auto-remove $buildDeps && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

COPY *.jar /judge/app.jar

COPY run.sh /judge/run.sh

COPY check_nacos.sh /judge/check_nacos.sh

ADD SandBox /judge/SandBox

COPY testlib.h /usr/include/testlib.h
	
WORKDIR /judge

ENTRYPOINT ["bash", "./check_nacos.sh"]

EXPOSE 8088

EXPOSE 5050
