#!/bin/bash

# Default values
CPUS=${1:-4}
MEMORY=${2:-8192} # 8 * 1024
DRIVER=${3:-docker}
ADDONS=${4:-"dashboard metrics-server ingress ingress-dns"}

# Apply minikube configurations
echo "Setting minikube configurations..."
minikube config set cpus "$CPUS"
minikube config set memory "$MEMORY"

# Start minikube with provided or default settings
echo "Starting minikube with driver: $DRIVER and addons: $ADDONS..."
minikube start --driver="$DRIVER" $(echo $ADDONS | xargs -n1 echo --addons=)

echo "Minikube started successfully!"