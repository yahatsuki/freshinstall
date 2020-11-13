#!/bin/sh

sudo apt-get update
sudo apt-get remove -y docker docker-engine docker.io containerd runc
sudo apt-get update

sudo apt-get install -y\
apt-transport-https \
ca-certificates \
curl \
gnupg-agent \
software-properties-common

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

sudo add-apt-repository \
"deb [arch=amd64] https://download.docker.com/linux/ubuntu \
$(lsb_release -cs) \
stable"

sudo apt-get update
sudo apt-get install -y docker-ce docker-ce-cli containerd.io

echo -n "Username?"
read username
sudo usermod -aG docker $username

docker volume create portainer_data	
docker run -d -p 8000:8000 -p 9000:9000 --name=portainer --restart=always -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer-ce
