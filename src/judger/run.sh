#!/bin/bash
# Nacos
while :
    do
        # 访问nacos注册中心，获取http状态码
        CODE=`curl -I -m 10 -o /dev/null -s -w %{http_code}  http://$NACOS_URL/nacos/index.html`
        # 判断状态码为200
        if [[ $CODE -eq 200 ]]; then
            # 输出绿色文字，并跳出循环
            echo -e "\033[42;34m nacos is ok \033[0m"
            break
        else
            # 暂停1秒
            sleep 1
        fi
    done

# SandBox
ulimit -s unlimited

chmod +777 SandBox

if test -z "$PARALLEL_TASK";then
	nohup ./SandBox --silent=true --file-timeout=10m --mount-conf=./mount.yaml &
	echo -e "\033[42;34m ./SandBox --silent=true --file-timeout=10m \033[0m"
elif [ -z "$(echo $PARALLEL_TASK | sed 's#[0-9]##g')" ]; then
	nohup ./SandBox --silent=true --file-timeout=10m --parallelism=$PARALLEL_TASK --mount-conf=./mount.yaml &
	echo -e "\033[42;34m ./SandBox --silent=true --file-timeout=10m --parallelism=$PARALLEL_TASK \033[0m"
else
	nohup ./SandBox --silent=true --file-timeout=10m --mount-conf=./mount.yaml &
	echo -e "\033[42;34m ./SandBox --silent=true --file-timeout=10m \033[0m"
fi

# App
FIXED_OPTS='-XX:+HeapDumpOnOutOfMemoryError -XX:HeapDumpPath=./log -Djava.security.egd=file:/dev/./urandom'

if test -z "$JAVA_OPTS";then
	java $FIXED_OPTS -jar ./app.jar
else
	java $JAVA_OPTS $FIXED_OPTS -jar ./app.jar
fi 