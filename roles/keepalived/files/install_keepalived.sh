#!/usr/bin/sh
#install keepalived
yum install popt-devel -y
cd /tmp
tar xvf keepalived-1.1.15.tar.gz
cd keepalived-1.1.15
./configure --sysconf=/etc --prefix=/usr/local/keepalived
make && make install
if [ $? -eq 0 ];then
	ln -s /usr/local/keepalived/sbin/* /usr/bin/
	echo "Install keepalived success"
else
	echo "Install keepalived faile"
fi
