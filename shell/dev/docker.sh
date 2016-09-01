#!/bin/sh

sudo apt update
sudo apt install apt-transport-https ca-certificates
sudo apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D
sudo sh -c 'echo "deb https://apt.dockerproject.org/repo $(echo "$(lsb_release -is)-$(lsb_release -cs)" | tr "[:upper:]" "[:lower:]") main" > /etc/apt/sources.list.d/docker.list'
sudo apt update
sudo apt install docker-engine
sudo update-rc.d docker disable # Disable run on startup

DOCKER_COMPOSE_VERSION=${DOCKER_COMPOSE_VERSION:-"$(curl -s -H "Accept: application/vnd.github.v3+json" -i https://api.github.com/repos/docker/compose/releases/latest | grep -Eo '"tag_name": ".*?"' | grep -Eo '[0-9\.]+')"}
sudo su -c "curl -L https://github.com/docker/compose/releases/download/${DOCKER_COMPOSE_VERSION}/docker-compose-$(uname -s)-$(uname -m) > /usr/local/bin/docker-compose"
sudo chmod +x /usr/local/bin/docker-compose

sudo groupadd docker
sudo gpasswd -a ${USER} docker
sudo service docker restart
