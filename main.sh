#!/bin/bash
sudo apt-get update
sudo apt-get install -y nginx
sudo service nginx start

#install node
sudo apt-get update
sudo apt-get install -y nodejs npm


sudo apt-get update
# Install MongoDB dependencies
sudo apt-get install -y gnupg
sudo apt install mongodb-server-core

# Import the MongoDB GPG key
wget -qO - https://www.mongodb.org/static/pgp/server-4.4.asc | sudo apt-key add -
# Create a list file for MongoDB
echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu focal/mongodb-org/4.4 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-4.4.list
# Update package list again
sudo apt-get update
# Install MongoDB
sudo apt-get install -y mongodb-org
# Start MongoDB service
sudo systemctl start mongod
# Enable MongoDB to start on boot
sudo systemctl enable mongod
