#!/bin/bash

echo
echo "Installing Java..."
sudo apt update && sudo apt install openjdk-8-jdk -y

sudo wget -O - https://debian.neo4j.org/neotechnology.gpg.key | sudo apt-key add - 
sudo echo 'deb https://debian.neo4j.org/repo stable/' | sudo tee -a /etc/apt/sources.list.d/neo4j.list
sudo apt-get update && sudo apt install neo4j -y

echo
echo "Updating Neo4j Config..."
echo

echo "Accept database connection from anywhere"
sudo sed -i 's/#dbms.connectors.default_listen_address=0.0.0.0/dbms.connectors.default_listen_address=0.0.0.0/g' /etc/neo4j/neo4j.conf
sudo sed -i 's/#dbms.connector.bolt.listen_address=:7687/dbms.connector.bolt.listen_address=:7687/g' /etc/neo4j/neo4j.conf
sudo sed -i 's/#dbms.connector.http.listen_address=:7474/dbms.connector.http.listen_address=:7474/g' /etc/neo4j/neo4j.conf
sudo sed -i 's/#dbms.connector.https.listen_address=:7473/dbms.connector.https.listen_address=:7473/g' /etc/neo4j/neo4j.conf

echo "Disable web authentication"
sudo sed -i 's/#dbms.security.auth_enabled=false/dbms.security.auth_enabled=false/g' /etc/neo4j/neo4j.conf

echo
echo "Starting Neo4j..."
sudo neo4j start
sudo systemctl enable neo4j

sudo ufw allow 7474/tcp