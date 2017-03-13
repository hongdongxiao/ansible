#!/bin/sh
### zabbix client install
### by hongdongxiao 2016-12-17
grep -q "zabbix" /etc/group
GROUP_IS=$?
if [ $GROUP_IS -eq 1 ];then
  groupadd zabbix
fi

grep -q "zabbix" /etc/passwd
USER_IS=$?
if [ $USER_IS -eq 1 ];then
  useradd -g zabbix zabbix -M -s /sbin/nologin
fi
ZABBIX_VERSION="2.4.7"
cd /tmp
tar -zxvf zabbix-${ZABBIX_VERSION}.tar.gz
cd zabbix-${ZABBIX_VERSION}
./configure --prefix=/usr/local/zabbix --enable-agent
make && make install


