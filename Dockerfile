FROM ubuntu:noble-20251001

RUN apt-get update && DEB_FRONTEND=noninteractive apt-get install -y curl gnupg ca-certificates lsb-release software-properties-common
RUN curl -fsSL https://download.docker.com/linux/ubuntu/gpg | gpg --dearmor -o /usr/share/keyrings/docker.gpg && \
    echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"  > /etc/apt/sources.list.d/docker.list
RUN apt-add-repository ppa:nrf-sarao/mesos
RUN apt-get update && DEB_FRONTEND=noninteractive apt-get install -y \
    docker-ce-cli=5:28.2.2-1~ubuntu.24.04~noble \
    mesos=1.11.0-1+ppa7~ubuntu24.04 && \
    rm -rf /var/lib/apt/lists/*
