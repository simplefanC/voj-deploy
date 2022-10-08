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
