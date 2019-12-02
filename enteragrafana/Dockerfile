FROM grafana/grafana
ADD datasource.yml /etc/grafana/provisioning/datasources/
ADD dashboard.yml /etc/grafana/provisioning/dashboards/
ADD docker-prometheus-monitoring_rev7.json /etc/grafana/provisioning/dashboards/
EXPOSE 3000