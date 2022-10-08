## 前言

当前文件夹为打包`voj-rsync`镜像的相关文件，将这些文件复制到同一个文件夹内，之后执行以下命令进行打包成镜像.

```shell
docker build -t voj-rsync .
```

或者直接下载本项目，进入到当前文件夹执行打包命令

```shell
git clone https://github.com/simplefanC/voj-deploy.git && cd voj-deploy/src/rsync

docker build -t voj-rsync .
```

**该服务用于测试用例数据在不同服务器之间的同步**

docker run启动

- 主服务器（Backend所在服务器）

  ```shell
  docker run -d --name voj-rsync \
  -v ./voj/testcase:/voj/testcase:ro \
  -e RSYNC_MODE=master \
  -e RSYNC_USER=vojrsync \
  -e RSYNC_PASSWORD=voj123456 \
  -p 873:873 \
  --restart=always \
  voj-rsync
  # registry.cn-shanghai.aliyuncs.com/simplefanc/voj_rsync:1.0
  ```

- 从服务器（Judgeserver所在的服务器）

  ```shell
  docker run -d --name voj-rsync \
  -v ./voj/testcase:/voj/testcase \
  -e RSYNC_MODE=slave \
  -e RSYNC_USER=vojrsync \
  -e RSYNC_PASSWORD=voj123456 \
  -e RSYNC_MASTER_ADDR=master_server_ip \
  -p 873:873 \
  --restart=always \
  voj-rsync
  # registry.cn-shanghai.aliyuncs.com/simplefanc/voj_rsync:1.0
  ```

  

docker-compose启动

- 主服务器（Backend所在服务器）

  ```yaml
  version: "3"
  services:
    voj-rsync-master:
  #    image: registry.cn-shanghai.aliyuncs.com/simplefanc/voj_rsync:1.0
      image: voj-rsync
      container_name: voj-rsync-master
      volumes:
        - ./voj/testcase:/voj/testcase:ro
      environment:
        - RSYNC_MODE=master # 当前为slave主服务
        - RSYNC_USER=vojrsync # 请勿修改
        - RSYNC_PASSWORD=voj123456 # 请修改数据同步密码
      ports:
        - "0.0.0.0:873:873"
  ```

- 从服务器（Judgeserver所在的服务器）

  ```yaml
  version: "3"
  services:
    voj-rsync-slave:
  #    image: registry.cn-shanghai.aliyuncs.com/simplefanc/voj_rsync:1.0
      image: voj-rsync
      container_name: voj-rsync-slave
      restart: always
      volumes:
        - ./judge/test_case:/voj/testcase
        - ./judge/log:/voj/log
      environment:
        - RSYNC_MODE=slave # 当前为slave从服务
        - RSYNC_USER=vojrsync # 请勿修改
        - RSYNC_PASSWORD=voj123456 # 与主服务器的rsync的密码一致
        - RSYNC_MASTER_ADDR=master_server_ip # 主服务器ip
      ports:
        - "0.0.0.0:873:873"
  ```



## 文件介绍

### 1. rsync.conf

主服务器的rsync配置文件

```shell
port = 873
uid = root
gid = root
use chroot = yes
read only = yes
log file = /voj/log/rsyncd.log
[testcase]
path = /voj/testcase/
list = yes
auth users = vojrsync
secrets file = /voj/rsyncd/rsyncd.passwd
```

### 2. run.sh

根据`$RSYNC_MODE`环境变量启动不同模式的rsync服务

```bash
#!/usr/bin/bash
if [ "$RSYNC_MODE" == "master" ]; then
	echo "$RSYNC_USER:$RSYNC_PASSWORD" > /voj/rsyncd/rsyncd_master.passwd
	chmod 600 /voj/rsyncd/rsyncd_master.passwd
	rsync --daemon --config=/voj/rsyncd/rsyncd.conf
else
	echo "$RSYNC_PASSWORD" > /voj/rsyncd/rsyncd_slave.passwd
	chmod 600 /voj/rsyncd/rsyncd_slave.passwd
	while true
	do
		rsync -avz --delete --progress --password-file=/voj/rsyncd/rsyncd_slave.passwd $RSYNC_USER@$RSYNC_MASTER_ADDR::testcase /voj/testcase >> /voj/log/rsync_slave.log
		sleep 100
	done
fi
```



### 3. Dockerfile

```dockerfile
FROM ubuntu:18.04

RUN apt-get update && apt-get -y install rsync

RUN mkdir -p /voj/rsyncd

COPY run.sh /voj/rsyncd/run.sh

COPY rsyncd.conf /voj/rsyncd/rsyncd.conf

CMD /bin/bash /voj/rsyncd/run.sh
```



