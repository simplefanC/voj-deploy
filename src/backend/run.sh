#!/bin/bash
FIXED_OPTS='-XX:+UseG1GC -XX:+ParallelRefProcEnabled -Xlog:gc*=warning:file=./log/gc.log:time -XX:+HeapDumpOnOutOfMemoryError -XX:HeapDumpPath=./log -Djava.security.egd=file:/dev/./urandom'
if test -z "$JAVA_OPTS";then
	java $FIXED_OPTS -jar ./app.jar
else
	java $JAVA_OPTS $FIXED_OPTS -jar ./app.jar
fi