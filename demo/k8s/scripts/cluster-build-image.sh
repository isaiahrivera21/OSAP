#!/bin/bash

APP="demo"

docker context use desktop-linux

IMAGE=${APP}
VERSION=v1
JAR_FILE=${APP}-0.0.1-SNAPSHOT.jar
MYAPP_DOCKER_PREFIX="^docker\_djava.*$"
cd ../..

if [ -f ${JAR_FILE} ]; 
then
    echo "Removing exsisting jar file"
fi

if mvn clean package -DskipTests=true; 
then
    echo "Build successful"
else
    echo "Build failed"
    cd -
    exit 1
fi

cd -
cp ../../target/${JAR_FILE} ..

# REMOVE IMAGE
if docker image rm ${IMAGE}:${VERSION};
then
    echo "Removing image from docker"
else
    echo "No image on docker"
fi

if minikube image rm ${IMAGE}:${VERSION};
then
    echo "Removing image from minikube"
else
    echo "No image on minikube"
fi

# BUILD IMAGE
if minikube image build -t ${IMAGE}:${VERSION} ..;
then
    echo "Successfully built image on minikube"
else
    echo "Unsuccessfully built image in minikube"
fi

if [ -f ${JAR_FILE} ];
then
    echo "Remove exsisting jar file"
    rm ${JAR_FILE}
fi