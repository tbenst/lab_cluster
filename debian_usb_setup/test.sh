#!/bin/bash
default=192.168.0.4
read -p "Enter IP address [$default]: " IP
IP=${IP:-$default}
echo "IP is $IP"