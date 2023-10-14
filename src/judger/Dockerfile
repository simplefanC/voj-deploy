FROM ubuntu:18.04

ARG DEBIAN_FRONTEND=noninteractive

ENV TZ=Asia/Shanghai

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
    python  \
    python3.7  \
    gcc  \
    g++  \
    mono-devel  \
    golang-go  \
    openjdk-17-jdk \
    curl \
    && apt-get clean  \
    && rm -rf /var/lib/apt/lists/*

RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

COPY *.jar /judge/app.jar

COPY run.sh /judge/run.sh

COPY SandBox /judge/SandBox
COPY mount.yaml /judge/mount.yaml

COPY testlib.h /usr/include/testlib.h

WORKDIR /judge

ENTRYPOINT ["bash", "./run.sh"]

EXPOSE 8088

EXPOSE 5050
