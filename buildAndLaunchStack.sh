#!/bin/bash
echo "building custom images"
docker build -t entera/prometheus ./enteraDocker/prometheusentera
docker build -t entera/grafana ./enteraDocker/enteragrafana
docker build -t entera/rubyloop ./enteraDocker/rubyDockerentera
echo "launching stack"
docker-compose up
