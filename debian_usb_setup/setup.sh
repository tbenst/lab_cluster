#!/bin/bash
cd /mnt/usb/debian_usb_setup
cp sshd_config /etc/ssh/sshd_config
mkdir -p /home/vangelderlab/.ssh
cat master_rsa.pub >> ~/.ssh/authorized_keys
chown -R vangelderlab ~/.ssh
chmod 600 ~/.ssh/authorized_keys
systemctl restart ssh
apt-get -y update
apt-get -y upgrade
apt-get -y upgrade-dist
apt-get -y install python

# show ethernet info
ip addr

default=$(hostname -I)
read -p "Enter IP address [$default]: " IP
IP=${IP:-$default}

default=255.255.254.0
read -p "Enter Netmask [$default]: " NETMASK
NETMASK=${NETMASK:-$default}

default=172.16.36.1
read -p "Enter Gateway [$default]: " GATEWAY
GATEWAY=${GATEWAY:-$default}

cp interfaces /etc/network/interfaces
echo "    address $IP" >> /etc/network/interfaces
echo "    netmask $NETMASK" >> /etc/network/interfaces
echo "    gateway $GATEWAY" >> /etc/network/interfaces
