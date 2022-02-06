[![Kind-Cluster-CI-CD](https://github.com/LQss11/MavenCI-K8sCD-JenkinsPipeline/actions/workflows/docker-env.yaml/badge.svg?branch=main)](https://github.com/LQss11/MavenCI-K8sCD-JenkinsPipeline/actions/workflows/docker-env.yaml)
# MavenCI-K8sCD-JenkinsPipeline
Java maven continuous integration and kubernetes continious deployment with jenkins pipeline.
## Qick Start
start the app by running:
```sh
docker-compose up -d --build
```
> make sure you have docker and docker-comoose are installed on your host machine!

## Create kind test cluster
in order to create kind cluster you will need to run the script and it will ask you to specify how many control-plane(managers) and worker nodes you need:
```sh
docker exec -it kind-cluster ./content/scripts/cluster-setup.sh
```
you can make sure that the cluster is working properly you can run to test a deployment:
```sh
docker exec -t kind-cluster sh -c "./content/scripts/deploy-nginx.sh"
```
Before stopping the stack you must need to remove the kind cluster containers created on your host machine for now by running:
```sh
docker exec -it kind-cluster kubectl delete -f ./content/deployment/ # To get rid of additional containers
docker exec -it kind-cluster kind delete cluster --name k8s-cluster # TODO add task on SIGTERM
``` 
you can then stop the docker compose stack by running:
```sh
docker-compose down
```