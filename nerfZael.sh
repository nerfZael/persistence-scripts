#!/bin/sh

sudo apt-get update
sudo apt-get -y install nginx
sudo systemctl start nginx.service
cd /etc/nginx/sites-available
sudo rm default
sudo bash -c "curl -o- https://raw.githubusercontent.com/nerfZael/persistence-scripts/main/nginx.conf > default"
sudo nginx -s reload

cd /home/ubuntu
wget https://dist.ipfs.io/go-ipfs/v0.12.0/go-ipfs_v0.12.0_linux-amd64.tar.gz
tar -xvzf go-ipfs_v0.12.0_linux-amd64.tar.gz
cd go-ipfs
sudo bash install.sh
cd ..
ipfs init

mkdir /home/ubuntu/polywrap
mkdir /home/ubuntu/polywrap/nodes
mkdir /home/ubuntu/polywrap/nodes/nodes

curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
export NVM_DIR=$HOME/.nvm;
source $NVM_DIR/nvm.sh;

nvm install 16.13.0 && nvm use 16.13.0

mkdir ~/.npm-global
npm config set prefix '~/.npm-global'
echo "export PATH=~/.npm-global/bin:\$PATH" >> ~/.profile
source ~/.profile

npm install yarn -g
npm install pm2 -g
