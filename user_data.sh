#!/bin/bash
# Atualiza pacotes
sudo apt-get update -y
sudo apt-get upgrade -y

# Instala Docker
sudo apt-get install -y docker.io

# Habilita e inicia o Docker
sudo systemctl enable docker
sudo systemctl start docker

# Instala Docker Compose
sudo curl -L "https://github.com/docker/compose/releases/download/v2.23.3/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

# Instala git
sudo apt-get install -y git

# Clona seu repositório (🔁 Substitua pela URL do seu Git)
cd /home/ubuntu
git clone https://github.com/seu-usuario/seu-repositorio.git wordpress-app
cd wordpress-app

# (Opcional) Monta o EFS - substitua o DNS pelo seu
# sudo apt-get install -y nfs-common
# sudo mkdir -p /mnt/efs
# sudo mount -t nfs4 -o nfsvers=4.1 fs-XXXXXX.efs.REGION.amazonaws.com:/ /mnt/efs
# sudo chown -R 1000:1000 /mnt/efs
# (Use volumes no docker-compose para apontar /var/www/html/wp-content para /mnt/efs)

# Sobe os containers
sudo docker-compose up -d