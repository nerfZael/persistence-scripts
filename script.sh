#!/bin/sh
mkdir /home/ubuntu/polywrap
git clone https://github.com/polywrap/nodes.git /home/ubuntu/polywrap
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
export NVM_DIR=$HOME/.nvm;
source $NVM_DIR/nvm.sh;

cd /home/ubuntu/polywrap/nodes/persistence-node
nvm install && nvm use

mkdir ~/.npm-global
npm config set prefix '~/.npm-global'
echo "export PATH=~/.npm-global/bin:\$PATH" >> ~/.profile
source ~/.profile

npm install yarn -g
npm install pm2 -g

env PATH=$PATH:/home/ubuntu/.nvm/versions/node/v16.13.0/bin /home/ubuntu/.npm-global/
lib/node_modules/pm2/bin/pm2 startup systemd -u ubuntu --hp /home/ubuntu

yarn
yarn build

pm2 start bin/main.js -- api --http 8080
pm2 save
