#!/bin/bash
echo "building custom images"
docker build -t entera/prometheus ./enteraDocker/prometheusentera
docker build -t entera/grafana ./enteraDocker/enteragrafana
docker build -t entera/rubyloop ./enteraDocker/rubyDockerentera
echo "launching stack"
sudo docker-compose -f /home/ubuntu/enteraDocker/docker-compose.yml up -d
#sudo docker-compose -f ~/Desktop/enteraRepot/enteraDocker/docker-compose.yml up -d