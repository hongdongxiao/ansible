#!/bin/sh
#Nginx install
yum -y install gcc openssl-devel pcre-devel zlib-devel
groupadd nginx
useradd nginx -g nginx -s /sbin/nologin
cd /tmp
tar -zxf /tmp/nginx-1.9.3.tar.gz
cd nginx-1.9.3
./configure \
--prefix=/usr/local/nginx \
--user=nginx \
--group=nginx \
--with-http_stub_status_module \
--with-http_ssl_module
make && make install
/usr/local/nginx/sbin/nginx -c /usr/local/nginx/conf/nginx.conf
echo "/usr/local/nginx/sbin/nginx -c /usr/local/nginx/conf/nginx.conf" >>/etc/rc.d/rc.local
