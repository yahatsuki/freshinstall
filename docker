#!/bin/sh

sudo apt update
sudo apt remove -y docker docker-engine docker.io containerd runc
sudo apt update

sudo apt install \
apt-transport-https -y\
ca-certificates -y\
curl -y\
gnupg-agent -y\
software-properties-common -y

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

sudo add-apt-repository \
"deb [arch=amd64] https://download.docker.com/linux/ubuntu \
$(lsb_release -cs) \
stable"

sudo apt update
sudo apt install -y docker-ce docker-ce-cli containerd.io
sudo apt install -y docker-compose

echo "---------------------------------------------------"
echo
echo -n "Username?"
read username
sudo usermod -a -G docker $username
