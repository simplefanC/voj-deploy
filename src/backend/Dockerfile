FROM openjdk:17

ENV TZ=Asia/Shanghai

ENV BACKEND_SERVER_PORT=6688

RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

COPY *.jar /voj/app.jar

COPY run.sh /voj/run.sh

WORKDIR /voj

CMD ["bash", "./run.sh"]

EXPOSE $BACKEND_SERVER_PORT
