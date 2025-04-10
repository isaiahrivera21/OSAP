ARG BASE_NAME=ubuntu
ARG BASE_IMAGE=24.10
# FROM $BASE_NAME:BASE_IMAGE

FROM ubuntu:24.10

ENV APP="demo"

RUN /bin/rm -rf /opt

RUN apt-get update && apt-get install -y \
    curl \
    wget \
    gpg \
    git \
    openjdk-21-jdk \
    dnsutils \
    dos2unix \
    vim

# Install DVC from the official repository
RUN mkdir -p /etc/apt/keyrings \
    && wget -qO - https://dvc.org/deb/iterative.asc | gpg --dearmor -o /etc/apt/keyrings/packages.iterative.gpg \
    && echo "deb [arch=amd64 signed-by=/etc/apt/keyrings/packages.iterative.gpg] https://dvc.org/deb/ stable main" > /etc/apt/sources.list.d/dvc.list \
    && chmod 644 /etc/apt/keyrings/packages.iterative.gpg /etc/apt/sources.list.d/dvc.list \
    && apt-get update \
    && apt-get install -y dvc

COPY $APP-0.0.1-SNAPSHOT.jar /$APP.jar

COPY ./scripts/djava-entrypoint.sh /djava-entrypoint.sh 

RUN dos2unix /djava-entrypoint.sh
# look up what dos2unix does 

RUN chmod +x /djava-entrypoint.sh
RUN mkdir -p logs

EXPOSE 3000
EXPOSE 3001 

ENTRYPOINT [ "/djava-entrypoint.sh" ]