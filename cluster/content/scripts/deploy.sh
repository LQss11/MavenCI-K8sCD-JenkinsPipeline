#!/bin/sh
# Pull required images
# docker image pull nginx:1.14.2
# docker image pull jenkins/jenkins:lts
# docker image pull mysql:5.7.32
# docker image pull sonatype/nexus3:3.37.0
# docker image pull phpmyadmin/phpmyadmin:5.1.1
# docker image pull sonarqube:7.6-community
# # Load downloaded images to the cluster nodes
# kind load docker-image nginx:1.14.2 --name k8s-cluster
# kind load docker-image jenkins/jenkins:lts --name k8s-cluster
# kind load docker-image mysql:5.7.32 --name k8s-cluster
# kind load docker-image sonatype/nexus3:3.37.0 --name k8s-cluster
# kind load docker-image phpmyadmin/phpmyadmin:5.1.1 --name k8s-cluster
# kind load docker-image sonarqube:7.6-community --name k8s-cluster
# Apply secrets
kubectl apply -f ./content/deployments/secrets
# Apply deployments manifests
kubectl apply -f ./content/deployments/
# Wait for pods status=running
echo "Waiting for pods STATUS to be RUNNING with spefied label..."
kubectl wait --for=jsonpath='{.status.phase}'=Running pod -l workload=cicd  --timeout 3m # Will stop if reach timeout
# Wait untill app curl on specified port produces response code 200 (timeout if not 200)
#echo "checking for jenkins app..."
#timeout 200 sh -c 'while [[ "$(curl -s -o /dev/null -w ''%{http_code}'' k8s-cluster-control-plane:30082)" != "200" ]]; do sleep 5; done && echo jenkins app running'

