FROM ubuntu:18.04

RUN apt-get update && apt-get -y install rsync

RUN mkdir -p /voj/rsyncd

COPY run.sh /voj/rsyncd/run.sh

COPY rsyncd.conf /voj/rsyncd/rsyncd.conf

CMD /bin/bash /voj/rsyncd/run.sh && tail -f /dev/null