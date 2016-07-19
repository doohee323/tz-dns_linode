#!/usr/bin/env bash

set -x

# for dns server
export ip=$(ip addr show eth0 | grep -Po 'inet \K[\d.]+')

sudo echo '' >> /etc/resolv.conf
sudo echo 'domain tz.com' >> /etc/resolv.conf

sudo apt-get update && apt-get upgrade -y
sudo apt-get install bind9 bind9utils -y
sudo apt-get install git -y

sudo cp -Rf /vagrant/_support/vagrant/resource/named.conf.local /etc/bind
sudo cp -Rf /vagrant/_support/vagrant/resource/db.tz.com /etc/bind

sudo sed -i "s/PUBLIC_IP/$ip/g" /etc/bind/db.tz.com

sudo service bind9 restart

dig @dns.tz.com tz.com

# install webmin
sudo apt-get install libnet-ssleay-perl libauthen-pam-perl libio-pty-perl apt-show-versions -y
sudo wget http://prdownloads.sourceforge.net/webadmin/webmin_1.801_all.deb 
sudo dpkg -i webmin_1.801_all.deb
echo "===================================="
echo "access to " https://$ip:10000/
sudo ufw allow 10000
sudo service webmin restart

# password for webmin : root / rootwebmin
sudo echo -e "rootwebmin\nrootwebmin" | passwd

exit 0



