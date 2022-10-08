#!/usr/bin/env sh
set -eu
# set
# -e 如果有任意一个命令返回了非0就退出
# -u 未赋值的变量会认为是错误，并且会向stderr写一个错误
if [ "$USE_HTTPS" == "true" ]; then
	envsubst '${SERVER_NAME} ${BACKEND_SERVER_HOST} ${BACKEND_SERVER_PORT}' < /etc/nginx/conf.d/default.conf.ssl.template > /etc/nginx/conf.d/default.conf
else
	envsubst '${SERVER_NAME} ${BACKEND_SERVER_HOST} ${BACKEND_SERVER_PORT}' < /etc/nginx/conf.d/default.conf.template > /etc/nginx/conf.d/default.conf
fi
# 系统调用exec是以新的进程去代替原来的进程，但进程的PID保持不变
exec "$@"
