FROM ubuntu:jammy-20250530

RUN apt-get update && DEB_FRONTEND=noninteractive apt-get install -y curl gnupg ca-certificates lsb-release software-properties-common
RUN curl -fsSL https://download.docker.com/linux/ubuntu/gpg | gpg --dearmor -o /usr/share/keyrings/docker.gpg && \
    echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"  > /etc/apt/sources.list.d/docker.list
RUN apt-add-repository ppa:nrf-sarao/mesos
RUN apt-get update && DEB_FRONTEND=noninteractive apt-get install -y \
    docker-ce-cli=5:26.1.4-1~ubuntu.22.04~jammy \
    mesos=1.11.0-1ubuntu4 && \
    rm -rf /var/lib/apt/lists/*
