ARG BASE_NAME=ubuntu
ARG BASE_IMAGE=24.10
# FROM $BASE_NAME:BASE_IMAGE

FROM ubuntu:24.10

ENV APP="demo"

RUN /bin/rm -rf /opt

RUN apt-get update && apt-get update -y 
# why is update here twice 

RUN apt-get update; apt-get install -y openjdk-21-jdk

RUN apt-get install -y dnsutils dos2unix vim 

COPY $APP-0.0.1-SNAPSHOT.jar /$APP.jar

COPY ./scripts/djava-entrypoint.sh /djava-entrypoint.sh 

RUN dos2unix /djava-entrypoint.sh
# look up what dos2unix does 

RUN chmod +x /djava-entrypoint.sh
RUN mkdir -p logs

EXPOSE 3000
EXPOSE 3001 

ENTRYPOINT [ "/djava-entrypoint.sh" ]