#!/bin/bash
sudo apt-get update -y
sudo apt-get upgrade -y
sudo apt-get install -y docker.io
sudo apt-get install -y mysql-client
sudo apt-get install -y git 
sudo apt-get install -y amazon-efs-utils
sudo systemctl enable docker
sudo systemctl start docker
sudo curl -L "https://github.com/docker/compose/releases/download/v2.23.3/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

cd /home/ubuntu
git clone https://github.com/Azisa06/wordpress-docker-aws.git wordpress-app
cd wordpress-app
sudo mkdir -p /mnt/efs
sudo mount -t efs -o tls fs-0e2ab46c6ad6ba82a:/ /mnt/efs
sudo chown -R 33:33 /mnt/efs
# Aguarda o Docker iniciar totalmente
until sudo docker info > /dev/null 2>&1; do
    echo "Aguardando o Docker iniciar..."
    sleep 3
done
sudo docker-compose up -d

mysql -h database-wordpress.cgrqa20q0xnf.us-east-1.rds.amazonaws.com -u admin -pminhasenha123 -e "CREATE DATABASE IF NOT EXISTS wordpress_db;"

echo "Instância pronta. Containers iniciados com sucesso."