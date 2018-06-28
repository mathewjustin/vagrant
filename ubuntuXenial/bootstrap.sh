#!/usr/bin/env bash
sudo -i
apt-get update
apt-get install -y apache2
if ! [ -L /var/www ]; then
  rm -rf /var/www
  ln -fs /vagrant /var/www
fi

echo STARTING TO SET UP DOCKER CONTAINERS
echo ==========================================
apt-get install docker-ce

echo bringig up Elasticsearch.. 
cd  ../docker-images/dockerES
docker-compose up

echo bringig up Redis.. 
cd ../dockerRedis
docker-compose up

echo bringig up MariaDb.. 
cd ../dockerMaria
docker-compose up


