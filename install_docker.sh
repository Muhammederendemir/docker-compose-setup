#!/bin/bash

if [ -z $SUDO_USER ]
then
    echo "===== Script need to be executed with sudo ===="
    echo "Change directory to 'network/setup'"
    echo "Usage: sudo ./docker.sh"
    exit 0
fi

# Variables ########################################
DOCKER_VERSION=20.10.2


# Functions ########################################
install_docker() {
    apt-get update -y
    apt-get install -y apt-transport-https ca-certificates curl software-properties-common
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -
    apt-key fingerprint 0EBFCD88
    add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
    apt-get update -y
    apt-get install -y "docker-ce=5:${DOCKER_VERSION}~*"
    docker info
    echo "======= Adding $SUDO_USER to the docker group ======="
    usermod -aG docker $SUDO_USER
    chmod 777 /var/run/docker.sock
}

reload_docker(){
service docker restart
systemctl daemon-reload
systemctl restart docker
}

# Let's Go!! ########################################
install_docker
reload_docker


echo "======= Done. PLEASE LOG OUT & LOG Back In ===="
echo "Then validate by executing    'docker info'"

