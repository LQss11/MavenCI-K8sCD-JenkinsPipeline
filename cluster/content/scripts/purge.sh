#!/bin/sh
# delete deployments manifests
kubectl delete -f ./content/deployments/
# delete secrets
kubectl delete -f ./content/deployments/secrets
# delete storages
kubectl delete -f ./content/deployments/storage

# Delete Cluster
kind delete cluster --name k8s-cluster