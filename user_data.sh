#!/bin/bash
#sudo apt-get update -y
#sudo apt-get upgrade -y
#sudo apt-get install -y docker.io
#sudo systemctl enable docker
#sudo systemctl start docker
#sudo curl -L "https://github.com/docker/compose/releases/download/v2.23.3/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
#sudo chmod +x /usr/local/bin/docker-compose
#sudo apt-get install -y git
#cd /home/ubuntu
#git clone https://github.com/Azisa06/wordpress-docker-aws.git wordpress-app
#cd wordpress-app
#sudo docker-compose up -d

#!/bin/bash
apt update -y
apt install -y docker.io nfs-common
systemctl start docker
systemctl enable docker
mkdir -p /usr/local/lib/docker/cli-plugins
curl -SL https://github.com/docker/compose/releases/download/v2.27.1/docker-compose-linux-x86_64 -o /usr/local/lib/docker/cli-plugins/docker-compose
chmod +x /usr/local/lib/docker/cli-plugins/docker-compose
EFS_ID=fs-04aec50e2e2bdfd4e.efs.us-east-1.amazonaws.com                
REGIAO=us-east-1
mkdir -p /mnt/efs
mount -t nfs4 -o nfsvers=4.1 ${EFS_ID}.efs.${REGIAO}.amazonaws.com:/ /mnt/efs
chown -R 33:33 /mnt/efs
git clone https://github.com/Azisa06/wordpress-docker-aws.git wordpress-app
cd wordpress-app
docker compose up -d
