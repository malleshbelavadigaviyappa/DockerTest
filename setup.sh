#!/bin/bash
set -e
echo "Installing docker"             
curl -sSL https://get.docker.com/ | sh
sudo service docker restart
echo "Installing docker-compose"
sudo curl -L https://github.com/docker/compose/releases/download/1.22.0/docker-compose-$(uname -s)-$(uname -m) -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
sudo curl -L  https://raw.githubusercontent.com/docker/compose/1.22.0/contrib/completion/bash/docker-compose -o /etc/bash_completion.d/docker-compose
sudo yum install epel-release -y
sudo yum -y install bash-completion python-pip 
sudo pip install docker-compose
echo "Installing java 1.8"
sudo yum install java-1.8.0-openjdk java-1.8.0-openjdk-devel -y
