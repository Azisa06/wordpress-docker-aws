#!/bin/bash
sudo apt-get update -y
sudo apt-get upgrade -y
sudo apt-get install -y docker.io mysql-client git
sudo systemctl enable docker
sudo systemctl start docker
sudo curl -L "https://github.com/docker/compose/releases/download/v2.23.3/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
sudo apt-get install -y git
cd /home/ubuntu
git clone https://github.com/Azisa06/wordpress-docker-aws.git wordpress-app
cd wordpress-app
sudo docker-compose up -d

mysql -h database-wordpress.cgrqa20q0xnf.us-east-1.rds.amazonaws.com -u admin -pminhasenha123 -e "CREATE DATABASE IF NOT EXISTS wordpress_db;"