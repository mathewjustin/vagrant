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
sudo -i
apt-get install docker.io -y
echo bringig up Elasticsearch.. 
cd  /vagrant/docker-files/dockerES
docker-compose up

echo bringig up Redis.. 
cd /vagrant/docker-files/dockerRedis
docker-compose up

echo bringig up MariaDb.. 
cd /vagrant/docker-files/dockerMaria
docker-compose up


