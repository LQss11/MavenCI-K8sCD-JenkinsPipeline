#!/bin/sh
docker image pull nginx:1.14.2
# Download image
kind load docker-image nginx:1.14.2 --name k8s-cluster
# Apply deployment
kubectl apply -f ./content/deployments/nginx-deployment.yaml
# Wait for pods status=running
echo "Waiting for nginx pods STATUS to be RUNNING"
kubectl wait --for=jsonpath='{.status.phase}'=Running pod -l app=nginx1.14.2 
# Wait untill nginx web app curl response code 200 (timeout in 20s if not 200)
echo "Waiting for nginx web app response code 200 (timeout 20)"
timeout 60 sh -c 'while [[ "$(curl -s -o /dev/null -w ''%{http_code}'' k8s-cluster-control-plane:30080)" != "200" ]]; do sleep 5; done && echo nginx app running'