
# MavenCI-K8sCD-JenkinsPipeline
Java maven continuous integration and kubernetes continious deployment with jenkins pipeline.
* Continuous Integration: [![Build](https://github.com/LQss11/MavenCI-K8sCD-JenkinsPipeline/actions/workflows/docker-env.yaml/badge.svg?branch=main)](https://github.com/LQss11/MavenCI-K8sCD-JenkinsPipeline/actions/workflows/docker-env.yaml)
## Qick Start
start the app by running:
```sh
docker-compose up -d --build
```
> make sure you have docker and docker-comoose are installed on your host machine!

## Create kind test cluster
in order to create kind cluster you will need to run the script and it will ask you to specify how many control-plane(managers) and worker nodes you need:
```sh
docker exec -it kind-cluster /bin/bash -c "./content/scripts/cluster-setup.sh"
```
you can make sure that the cluster is working properly you can run to test a deployment:
```sh
docker exec -t kind-cluster /bin/bash -c "./content/scripts/deploy.sh"
```
Before stopping the stack you must need to remove the kind cluster containers created on your host machine for now by running:
```sh
docker exec -t kind-cluster /bin/bash -c  "kubectl delete -f ./content/stack/devops-cicd/namespace.yaml" # Delete deployed resources by specified ns
docker exec -it kind-cluster kind delete cluster --name k8s-cluster # TODO add task on SIGTERM
``` 
you can then stop the docker compose stack by running:
```sh
docker-compose down
```
## Jenkins Groovy Scripts 
You can find the groovy scripts used in **./cluster/content/jenkins-scripts** directory:

- init.groovy: 
  1. will setup Initial username and password using env variables (you can change .env variables to update admin username and password).
  2. Associate the created user to become admin.
  3. Checking logged-in users can do anything checkbox.
  4. Enabling slave master access control.
  5. Setting default URL
- dockerhub-cred.groovy
  1. Setup dockerhub init credentials.