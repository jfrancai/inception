#!/bin/bash

echo "Update the apt package index and install packages to allow apt to use a repository over HTTPS..."
sudo apt-get update
sudo apt-get install \
    ca-certificates \
    curl \
    gnupg \
    lsb-release \
	vim \
	git \
	make

echo "Adding Docker’s official GPG key..."
sudo mkdir -m 0755 -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg

echo "Settings up the Docker repository..."
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/debian \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

echo "Updating the apt package index..."
sudo apt-get update

echo "Installing the latest Docker version..."
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

echo "Volume directories created."
mkdir -p ../data/mysql ../data/html

echo "Download docker-compose v1.29.2 and save the executable file at /usr/local/bin/docker-compose..."
sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

echo "Docker group created. $USER added to the group."
sudo groupadd docker
sudo usermod -aG docker $USER
# Activate the changes to groups
newgrp docker

echo "DNS set up."
sudo sed -i -e 's/localhost/jfrancai.42.fr/' \
	-e 's/debian/jfrancai.42.fr/' \
	/etc/hosts
