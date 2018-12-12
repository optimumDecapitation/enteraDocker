#!/bin/bash
echo "building custom images"
docker build -t bonial/prometheus ./prometheusBonial
docker build -t bonial/grafana ./grafanaBonial
docker build -t optimum/rubyloop ./rubyDockerBonial
echo "launching stack"
docker-compose up