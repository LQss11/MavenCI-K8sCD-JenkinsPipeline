# MavenCI-K8sCD-JenkinsPipeline
Java maven continuous integration and kubernetes continious deployment with jenkins pipeline.
## Qick Start
start the app by running:
```sh
docker-compose up -d --build
```
you can stop it by running:
```sh
docker-compose down
```
> make sure you have docker and docker-comoose are installed on your host machine!

## Create kind cluster
in order to create kind cluster you will need to run the script:
```sh
docker exec -it kind-cluster ./cluster-setup.sh
```