#!/bin/sh

sudo npm i -g nuxi

USERNAME=$(whoami)

sudo cp -r /home/${USERNAME}/.ssh_copy/* /home/${USERNAME}/.ssh
sudo sed -i '/UseKeychain/d' /home/${USERNAME}/.ssh/config
sudo chmod -R 600 /home/${USERNAME}/.ssh
sudo chmod 700 /home/${USERNAME}/.ssh

cd /workspace

[ ! -d \"node_modules\" ] && sudo chown -R node:node node_modules
npm ci

if [ ! -f ".env.development" ]; then
  echo ".env.development does not exist, copying..."
  cp .env.development.sample .env.development
else
  echo ".env.development exists."
fi