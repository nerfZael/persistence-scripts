#!/bin/sh
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
source ~/.bashrc
nvm install && nvm use
npm install yarn -g
npm install pm2 -g
pm2 startup
yarn
yarn build
pm2 start build/main.js api --http 80
