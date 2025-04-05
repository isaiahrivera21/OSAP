#!/bin/bash

APP="demo"
IMAGE=${APP}
VERSION=v1
JAR_FILE="${APP}-0.0.1-SNAPSHOT.jar"
MYAPP_DOCKER_PREFIX="^docker\_djava.*$"
WORK_DIR=$(pwd)

cd ../..

if [ -f "${JAR_FILE}" ]; 
then
    echo "Removing existing JAR file"
    rm -f "${JAR_FILE}"
else
    echo "No JAR file found to remove"
fi

if mvn clean package -DskipTests=true; 
then
    echo "Build successful"
else
    echo "Build failed"
    cd "$WORK_DIR"
    exit 1
fi

cd -
cp ../../target/${JAR_FILE} ..

echo "Setting up Minikube Docker environment..."
eval $(minikube docker-env)

echo "Removing existing images if present..."
docker image rm ${IMAGE}:${VERSION} || echo "No image in local Docker"
minikube image rm ${IMAGE}:${VERSION} || echo "No image in Minikube"

echo "Building image inside Minikube..."
if minikube image build -t ${IMAGE}:${VERSION} ..; 
then
    echo "Successfully built image on Minikube"
else
    echo "Failed to build image in Minikube"
    exit 1
fi

if [ -f "${JAR_FILE}" ]; 
then
    echo "Removing existing JAR file"
    rm -f "${JAR_FILE}"
fi

echo "Image build and cleanup completed successfully!"
