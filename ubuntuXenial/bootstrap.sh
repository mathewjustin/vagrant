#!/usr/bin/env bash
sudo -i
apt-get update
apt-get install -y apache2
if ! [ -L /var/www ]; then
  rm -rf /var/www
  ln -fs /vagrant /var/www
fi

ssh-keyscan -H github.com >> ~/.ssh/known_hosts

echo STARTING TO SET UP DOCKER CONTAINERS
echo ==========================================
sudo su

sudo curl -L "https://github.com/docker/compose/releases/download/1.23.1/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose

sudo chmod +x /usr/local/bin/docker-compose

#https://github.com/docker-library/elasticsearch/issues/111
sudo sysctl -w vm.max_map_count=262144

apt-get install docker.io -y
echo bringig up Elasticsearch.. 
cd  /vagrant/docker-files/dockerES
docker-compose up -d 

echo bringig up Redis.. 
cd /vagrant/docker-files/dockerRedis
docker-compose up -d

echo bringig up MariaDb.. 
cd /vagrant/docker-files/dockerMaria
docker-compose up -d


echo bringig up Cassandra..
cd /vagrant/docker-files/dockerCassandra
docker-compose up -d


