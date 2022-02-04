#!/bin/sh

# Create initial cluster config template
cat >kind-config.yaml <<EOF
kind: Cluster
apiVersion: kind.x-k8s.io/v1alpha4
nodes:
- role: control-plane
EOF

re='^[1-9]+$'
while read -p "How many manager nodes do you need in the cluster?:" node; do
    if ! [[ $node =~ $re ]]; then
        echo "error: Not a valid number" >&2
        exit 1
    fi
    for i in $(seq 1 $node); do
        echo - role: control-plane >>kind-config.yaml
    done
    break
done

while read -p "How many worker nodes do you need in the cluster?:" node; do
    if ! [[ $node =~ $re ]]; then
        echo "error: Not a valid number" >&2
        exit 1
    fi
    for i in $(seq 1 $node); do
        echo - role: worker >>kind-config.yaml
    done
    break
done

# kind create cluster --name k8s-playground --config kind-config.yaml
