#!/bin/sh
mkdir /home/ubuntu/polywrap
git clone https://github.com/polywrap/nodes.git /home/ubuntu/polywrap
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
. ~/.profile
cd /home/ubuntu/polywrap/nodes/persistence-node
nvm install && nvm use
npm install yarn -g
npm install pm2 -g
pm2 startup
yarn
yarn build
pm2 start build/main.js api --http 80
