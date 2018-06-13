#!/bin/bash

#docker run -ti -v $(pwd):/mattermost -v /var/run/docker.sock:/var/run/docker.sock -p 8065:8065 golang:1.9.2-stretch


apt-get update
apt-get install -y apt-transport-https ca-certificates curl gnupg2 software-properties-common
curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add -
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable"
echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
curl -sL https://deb.nodesource.com/setup_8.x | bash -

apt-get install -y  yarn zip libpng-dev nodejs docker-ce

# Change libpng
wget -q -O /tmp/libpng12.deb http://mirrors.kernel.org/ubuntu/pool/main/libp/libpng/libpng12-0_1.2.54-1ubuntu1_amd64.deb \
  && sudo dpkg -i /tmp/libpng12.deb \
  && rm /tmp/libpng12.deb

mkdir -p src/github.com
cd src/github.com
ln -s /mattermost .

cd mattermost/mattermost-server

#make run