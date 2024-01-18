#!/bin/sh
set -e

echo "Installing GCS FUSE..."

apt-get update
apt-get install -y lsb-base lsb-release
apt-get install -y fuse
apt-get install -y curl

export GCSFUSE_REPO=gcsfuse-`lsb_release -c -s`
echo "deb https://packages.cloud.google.com/apt $GCSFUSE_REPO main" | tee /etc/apt/sources.list.d/gcsfuse.list
curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo tee /usr/share/keyrings/cloud.google.asc

apt-get update
apt-get install -y gcsfuse
