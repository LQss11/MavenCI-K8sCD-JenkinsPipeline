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
in order to create kind cluster:
```sh
docker exec -it kind-cluster kind create cluster
```
now in order to connect to the kubernetes api server you have to update the kubectl config inside the container by running:
```sh
kubectl config view
```
and then make sure to update the same port and ip address from inside the cluster docker container:
```sh
kubectl config set clusters.<my-cluster>.server https://<host>:<port>
```
- ~~ the host ip address has its own dns through docker which is **kubernetes.docker.internal** ~~ -> this needs a tls cert when trying to access host machine k8s api server, replace **kubernetes.docker.internal** by **kind-control-plane**
- the value of `my-cluster` in this case is **kind-control-plane** since it's the default kind cluster to be created if we run `kind create cluster` without specifying the name.
- The port is usually 6443 by default 
```sh
kubectl config set clusters.kind-kind.server https://kind-control-plane:6443
```
when you are done you can delete the cluster by running: 
```sh
docker exec -it kind-cluster kind delete cluster
```
