#!/bin/sh
npm install yarn -g
npm install pm2 -g
pm2 startup
yarn
yarn build
pm2 start build/main.js api --http 80
