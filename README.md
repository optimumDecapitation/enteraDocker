# bonialDocker
docker ruby application included in a docker compose monitoring stack with build scripts and grafana dashboards included

A looping ruby application polls the http://candidateexercise.s3-website-eu-west-1.amazonaws.com/exercise1.yaml endpoint, however, throughout testing I consistantly recieved 404's from all attempts to get the resources located there.  The instructions imply that this is JSON (in spite of the yaml file extension) so I also tried http://candidateexercise.s3-website-eu-west-1.amazonaws.com/exercise1.json, but to no avail. Since I was unable to procure the actual json document I created a failure logic that prints out a boilerplate version of the required terraform resources based upon some default values.  I also added a web server to the application to allow for starting and stopping the applicaiton and polling it for container health.  

A custom dockerfile was created to generate an image to contain this Ruby application and this container is build by the provisioning shell script in the root directory of the repo (along with the other containers that required custom images).

A monitoring stack was included, made up of custom images for grafana and prometheus that are also built by the provisioning script. These custom images include configuration changes allowing for Cadvisor to be polled by prometheus automatically and also allow for the immediate availability of container monitoring dashboards in grafana.

The provisioning script also calls the final "docker-compose up" command making that script the only thing that needs to be executed once the repository is cloned to a docker-host.
