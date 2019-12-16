#!/bin/bash
echo "building custom images"
docker build -t entera/prometheus prometheusentera
docker build -t entera/grafana enteragrafana
docker build -t entera/rubyloop rubyDockerentera
docker build -t entera/nodejs nodeDockerentera
echo "launching stack"
#sudo docker-compose -f /home/ubuntu/enteraDocker/docker-compose.yml up -d
sudo docker-compose -f ~/Desktop/enteraRepot/enteraDocker/docker-compose.yml up -d