#!/bin/bash
echo "building custom images"
docker build -t entera/prometheus ./prometheusentera
docker build -t entera/grafana ./enteragrafana
docker build -t entera/rubyloop ./rubyDockerentera
echo "launching stack"
docker-compose up