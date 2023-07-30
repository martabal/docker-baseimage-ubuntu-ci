FROM ubuntu:22.04

LABEL maintainer="martabal"

ENV DEBIAN_FRONTEND=noninteractive

RUN \
  apt-get update && \
  apt-get install --no-install-recommends -y \
    bash \
    binfmt-support \
    build-essential \
    ca-certificates \
    cargo \
    chromium-browser \
    composer \
    coreutils \
    curl \
    git \
    gnupg \
    jq \
    libpq-dev \
    lsb-release \
    nodejs \
    npm \
    openssh-client \
    php-tokenizer \
    python3 \
    python3-pil \
    python3-pip \
    qemu-user-static \
    rustc \
    rustfmt \
    software-properties-common \
    libsqlite3-dev && \
  mkdir -p /etc/apt/keyrings && \
  curl -fsSL https://download.docker.com/linux/ubuntu/gpg | gpg --dearmor -o /etc/apt/keyrings/docker.gpg && \
  chmod a+r /etc/apt/keyrings/docker.gpg && \
  echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | tee /etc/apt/sources.list.d/docker.list > /dev/null && \
  apt-get update && \
  apt-get install --no-install-recommends -y \
    docker-ce \
    docker-ce-cli \
    docker-buildx-plugin && \
  echo "**** cleanup ****" && \
  apt-get autoremove -y --purge && \
  apt-get clean && \
  rm -rf \
    /tmp/* \
    /root/.cache \
    /root/.npm
