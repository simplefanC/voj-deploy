ulimit -s unlimited

chmod +777 SandBox

if test -z "$PARALLEL_TASK";then
	nohup ./SandBox --silent=true --file-timeout=10m &
	echo -e "\033[42;34m ./SandBox --silent=true --file-timeout=10m \033[0m"
elif [ -z "$(echo $PARALLEL_TASK | sed 's#[0-9]##g')" ]; then
	nohup ./SandBox --silent=true --file-timeout=10m --parallelism=$PARALLEL_TASK &
	echo -e "\033[42;34m ./SandBox --silent=true --file-timeout=10m --parallelism=$PARALLEL_TASK \033[0m"
else
	nohup ./SandBox --silent=true --file-timeout=10m &
	echo -e "\033[42;34m ./SandBox --silent=true --file-timeout=10m \033[0m"
fi

FIXED_OPTS='-XX:+UseG1GC -XX:+ParallelRefProcEnabled -Xlog:gc*=warning:file=./log/gc.log:time -XX:+HeapDumpOnOutOfMemoryError -XX:HeapDumpPath=./log -Djava.security.egd=file:/dev/./urandom'

if test -z "$JAVA_OPTS";then
	java $FIXED_OPTS -jar ./app.jar
else
	java $JAVA_OPTS $FIXED_OPTS -jar ./app.jar
fi 