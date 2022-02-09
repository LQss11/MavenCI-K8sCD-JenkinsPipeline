#!/bin/sh
# Apply deployments manifests
kubectl apply -f ./content/deployments/
# delete secrets
kubectl apply -f ./content/deployments/secrets