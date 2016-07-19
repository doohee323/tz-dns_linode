#!/usr/bin/env bash

sudo su
set -x

# for dns server
export ip=$(ip addr show eth0 | grep -Po 'inet \K[\d.]+')

echo '' >> /etc/resolv.conf
echo 'domain tz.com' >> /etc/resolv.conf

apt-get update && apt-get upgrade -y
apt-get install bind9 bind9utils -y
apt-get install git -y

cp -Rf /vagrant/_support/vagrant/resource/named.conf.local /etc/bind
cp -Rf /vagrant/_support/vagrant/resource/db.tz.com /etc/bind

sed -i "s/PUBLIC_IP/$ip/g" /etc/bind/db.tz.com

service bind9 restart

dig @dns.tz.com tz.com

# install webmin
apt-get install libnet-ssleay-perl libauthen-pam-perl libio-pty-perl apt-show-versions -y
wget http://prdownloads.sourceforge.net/webadmin/webmin_1.801_all.deb 
dpkg -i webmin_1.801_all.deb
echo "===================================="
echo "access to " https://$ip:10000/
ufw allow 10000
service webmin restart

# password for webmin : root / rootwebmin
echo -e "rootwebmin\nrootwebmin" | passwd

exit 0



