#!/usr/bin/env bash

set -x

sudo echo "" > /root/.profile
sudo echo "alias ll='ls -al'" >> /root/.profile
source /root/.profile

export ip=$(ip addr show eth0 | grep -Po 'inet \K[\d.]+')
sudo echo $ip 'dns.tz.com' >> /etc/hosts

sudo ln -sf /usr/share/zoneinfo/EST /etc/localtime

exit 0
