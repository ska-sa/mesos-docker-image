FROM ubuntu:jammy-20230522

RUN apt-get update && DEB_FRONTEND=noninteractive apt-get install -y curl gnupg ca-certificates lsb-release software-properties-common
RUN curl -fsSL https://download.docker.com/linux/ubuntu/gpg | gpg --dearmor -o /usr/share/keyrings/docker.gpg && \
    echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"  > /etc/apt/sources.list.d/docker.list
RUN apt-add-repository ppa:nrf-sarao/mesos
RUN apt-get update && DEB_FRONTEND=noninteractive apt-get install -y \
    docker-ce-cli=5:23.0.1-1~ubuntu.22.04~jammy \
    mesos=1.11.0-1ubuntu3 && \
    rm -rf /var/lib/apt/lists/*
