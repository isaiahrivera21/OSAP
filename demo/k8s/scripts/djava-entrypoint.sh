#!/bin/bash
set -e

APP="demo"
NODE_IP=$(awk 'END{print $1}' /etc/hosts)
NODE_HOSTNAME=$(awk 'END{print $2}' /etc/hosts)

APP_LOG=/logs/app.log

mkdir -p /logs 

APP_JAR=/${APP}.jar 

RUN_CONFIG="-classpath /app/target/classes"

echo "Container's IP address: $NODE_IP" | tee -a ${APP_LOG}
echo "Container's hostname: $NODE_HOSTNAME" | tee -a ${APP_LOG}

echo "Starting App Server" | tee -a ${APP_LOG}

java ${RUN_CONFIG} -jar ${APP_JAR} 2>&1 >> ${APP_LOG}