# enteraDocker
docker ruby application included in a docker compose monitoring stack with build scripts and grafana dashboards included

A looping ruby application polls an S3 bucket for some set of JSON data. NOTE : I created a failure logic that prints out a boilerplate version of some terraform resources based upon some default values.  I also added a web server to the application to allow for starting and stopping the applicaiton and polling it for container health.  

A custom dockerfile was created to generate an image to contain this Ruby application and this container is built by the provisioning shell script in the root directory of the repo (along with the other containers that required custom images).

A monitoring stack was included, made up of custom images for grafana and prometheus that are also built by the provisioning script. These custom images include configuration changes allowing for Cadvisor to be polled by prometheus automatically and also allow for the immediate availability of container monitoring dashboards in grafana.

The provisioning script also calls the final "docker-compose up" command making that script the only thing that needs to be executed once the repository is cloned to a docker-host.

After cloning this repo to a docker host simply run the https://github.com/optimumDecapitation/enteraDocker/blob/master/buildAndLaunchStack.sh script and the entire process should bring up a fully functioning stack.  Grafana login is still required, to reach the monitoring dashboards.
