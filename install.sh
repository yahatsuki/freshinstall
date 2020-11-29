#!/bin/sh

sudo sed -i "/^# deb.*multiverse/ s/^# //" /etc/apt/sources.list

sudo apt-get update
sudo apt-get upgrade -y

sudo apt-get update
sudo apt-get install -y fail2ban
sudo systemctl start fail2ban
sudo systemctl enable fail2ban

sudo apt-get update
sudo apt-get install -y clamav clamav-daemon
sudo systemctl stop clamav-freshclam
sudo freshclam
sudo mkdir /var/lib/clamav
sudo systemctl start clamav-freshclam

sudo apt-get install -y unattended-upgrades
sudo /etc/init.d/unattended-upgrades start

sudo apt-get install xe-guest-utilities

reboot

