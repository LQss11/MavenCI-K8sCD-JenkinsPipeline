#!/bin/sh
# delete deployments manifests
echo "##########################"
echo "   Deleting Deployments   "
echo "##########################"
kubectl delete -f ./content/stack/devops-cicd/deployments/
# delete secrets
echo "##########################"
echo "     Deleting Secrets     "
echo "##########################"
kubectl delete -f ./content/stack/devops-cicd/secrets/
# delete storages
echo "##########################"
echo "     Deleting Volumes     "
echo "##########################"
kubectl delete -f ./content/stack/devops-cicd/storage/

# Delete Cluster
echo "##########################"
echo "  Deleting kind cluster   "
echo "##########################"
kind delete cluster --name k8s-cluster