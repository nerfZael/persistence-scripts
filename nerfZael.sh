#!/bin/sh

sudo apt-get update
sudo apt-get install nginx
sudo systemctl start nginx.service

cd /etc/nginx/conf.d
sudo nginx -s reload

wget https://dist.ipfs.io/go-ipfs/v0.12.0/go-ipfs_v0.12.0_linux-amd64.tar.gz
tar -xvzf go-ipfs_v0.12.0_linux-amd64.tar.gz
cd go-ipfs
sudo bash install.sh
cd ..
ipfs init

mkdir /home/ubuntu/polywrap
git clone https://github.com/nerfZael/nodes.git /home/ubuntu/polywrap/nodes
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
export NVM_DIR=$HOME/.nvm;
source $NVM_DIR/nvm.sh;

cd /home/ubuntu/polywrap/nodes/nodes/persistence-node
nvm install && nvm use

mkdir ~/.npm-global
npm config set prefix '~/.npm-global'
echo "export PATH=~/.npm-global/bin:\$PATH" >> ~/.profile
source ~/.profile

npm install yarn -g
npm install pm2 -g
