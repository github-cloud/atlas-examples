#!/bin/bash

set -ex

NOMAD_VERSION=0.3.0

sudo apt-get -qq -y update

# install dependencies
echo "Installing dependencies..."
sudo apt-get -qq -y install curl unzip

# install nomad
echo "Fetching nomad..."
cd /tmp/

wget -q https://releases.hashicorp.com/nomad/${NOMAD_VERSION}/nomad_${NOMAD_VERSION}_linux_amd64.zip -O nomad.zip

echo "Installing nomad..."
unzip nomad.zip
rm nomad.zip
sudo chmod +x nomad
sudo mv nomad /usr/bin/nomad
sudo mkdir -pm 0755 /etc/nomad.d

# setup nomad directories
sudo mkdir -pm 0755 /opt/nomad
sudo mkdir -p /opt/nomad/data
sudo mkdir -p /opt/nomad/jobs

echo "Nomad installation complete."
