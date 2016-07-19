#!/usr/bin/env bash

sudo su
set -x

echo "" > /root/.profile
echo "alias ll='ls -al'" >> /root/.profile
source /root/.profile

export ip=$(ip addr show eth0 | grep -Po 'inet \K[\d.]+')
echo $ip 'dns.tz.com' >> /etc/hosts

ln -sf /usr/share/zoneinfo/EST /etc/localtime

exit 0
