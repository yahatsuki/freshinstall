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
echo -e "APT::Periodic::Update-Package-Lists \"1\";\nAPT::Periodic::Unattended-Upgrade \"1\";\n" > /etc/apt/apt.conf.d/20auto-upgrades
sudo /etc/init.d/unattended-upgrades restart

sudo apt-get update
sudo apt-get remove -y docker docker-engine docker.io containerd runc
sudo apt-get update
sudo apt-get install -y \    apt-transport-https \    ca-certificates \    curl \    gnupg-agent \    software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository \   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \   $(lsb_release -cs) \   stable"
sudo apt-get update
sudo apt-get install -y docker-ce docker-ce-cli containerd.io
sudo usermod -aG docker your-user

docker volume create portainer_data	
docker run -d -p 8000:8000 -p 9000:9000 --name=portainer --restart=always -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer-ce
