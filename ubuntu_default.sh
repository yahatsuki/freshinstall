#!/bin/sh

echo -n "New Hostname? > "
read hostname
hostnamectl set-hostname $hostname

echo -n "New Username?"
read username
groupadd $username
usermod -d /home/$username -m -g $username -l $username

echo -n "New Password?"
read password
sudo password $username $password

reboot
