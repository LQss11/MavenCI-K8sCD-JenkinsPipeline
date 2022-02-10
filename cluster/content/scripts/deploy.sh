#!/bin/sh

# Pull required images
# docker image pull nginx:1.14.2
# # Load downloaded images to the cluster nodes
# kind load docker-image nginx:1.14.2 --name k8s-cluster

# Apply namespace
echo "##########################"
echo "    Applying namespace    "
echo "##########################"
kubectl apply -f ./content/stack/devops-cicd/namespace.yaml
# Apply PV and PVC
echo "##########################"
echo "Applying all PVs and PVCs"
echo "##########################"
kubectl apply -f ./content/stack/devops-cicd/storage/
# Apply secrets
echo "##########################"
echo "      Applying Secrets    "
echo "##########################"
kubectl apply -f ./content/stack/devops-cicd/secrets/
# Apply deployments manifests
echo "##########################"
echo "   Applying Deployments   "
echo "##########################"
kubectl apply -f ./content/stack/devops-cicd/deployments/
# Wait for pods status=running
echo "##########################"
echo "   Checking Pods Status   "
echo "##########################"
kubectl wait --for=jsonpath='{.status.phase}'=Running pod -l workload=cicd  --timeout 3m # Will stop if reach timeout
# Wait untill app curl on specified port produces response code 200 (timeout if not 200)
#echo "checking for jenkins app..."
#timeout 200 sh -c 'while [[ "$(curl -s -o /dev/null -w ''%{http_code}'' k8s-cluster-control-plane:30082)" != "200" ]]; do sleep 5; done && echo jenkins app running'

