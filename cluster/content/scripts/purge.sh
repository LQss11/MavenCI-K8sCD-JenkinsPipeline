#!/bin/sh
# delete deployments manifests
echo "##########################"
echo "   Deleting Deployments   "
echo "##########################"
kubectl delete -f ./content/deployments/
# delete secrets
echo "##########################"
echo "     Deleting Secrets     "
echo "##########################"
kubectl delete -f ./content/deployments/secrets
# delete storages
echo "##########################"
echo "     Deleting Volumes     "
echo "##########################"
kubectl delete -f ./content/deployments/storage

# Delete Cluster
echo "##########################"
echo "  Deleting kind cluster   "
echo "##########################"
kind delete cluster --name k8s-cluster