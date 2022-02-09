#!/bin/sh
# Apply deployments manifests
kubectl delete -f ./content/deployments/
# delete secrets
kubectl delete -f ./content/deployments/secrets