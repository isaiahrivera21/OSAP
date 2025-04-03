#!/bin/bash
set -e

APP="djava"
NODE_IP=$(awk 'END{print $1}' /etc/hosts)
NODE_HOSTNAME=$(awk 'END{print $2}' /etc/hosts)

APP_LOG=/log/app.log

mkdir -p /logs 

APP_JAR=/${APP}.jar 

RUN_CONFIG="-classpath /app/target/classes"

java ${RUN_CONFIG} -jar ${APP_JAR} 2>&1 >> ${APP_LOG}