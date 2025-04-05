#!/bin/bash

CPUS=${1:-4}
MEMORY=${2:-8192}  # 8 * 1024
DRIVER=${3:-docker}
ADDONS=${4:-"dashboard metrics-server ingress ingress-dns"}

echo "Stopping and deleting any existing Minikube cluster..."
minikube stop
minikube delete

echo "Setting Minikube configurations..."
minikube config set cpus "$CPUS"
minikube config set memory "$MEMORY"

echo "Starting Minikube with driver: $DRIVER and addons: $ADDONS..."
minikube start --driver="$DRIVER" $(echo $ADDONS | xargs -n1 echo --addons=)

echo "Minikube started successfully!"
