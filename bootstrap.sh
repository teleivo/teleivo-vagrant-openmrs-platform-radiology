#!/bin/bash

# Install git and docker, docker-compose
echo "deb https://apt.dockerproject.org/repo ubuntu-trusty main" | sudo tee /etc/apt/sources.list.d/docker.list
apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D
apt-get update && \
apt-get install -y git docker-engine && \
apt-get install -y python-pip && \
pip install docker-compose && \
git clone https://github.com/teleivo/docker-openmrs-module-radiology.git /tmp/docker-openmrs-module-radiology && \
cd /tmp/docker-openmrs-module-radiology && docker-compose build
