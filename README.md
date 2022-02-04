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

## Create kind test cluster
in order to create kind cluster you will need to run the script and it will ask you to specify how many control-plane(managers) and worker nodes you need:
```sh
docker exec -it kind-cluster ./cluster-setup.sh
```
you can make sure that the cluster is working properly by running:
```sh
docker exec -it kind-cluster sh -c "apk add curl && kubectl apply -f ./nginx-deployment.yaml && curl k8s-cluster-control-plane:30080" # you can also run the same curl but with k8s-cluster-worker dns
```
>You can use dns of the kindest node containers to get the output