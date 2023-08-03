FROM ubuntu:23.04

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
    libsqlite3-dev \
    libvips \
    lsb-release \
    openssh-client \
    php-tokenizer \
    python3 \
    python3-pip \
    python3-poetry \
    qemu-user-static \
    rustc \
    rustfmt \
    software-properties-common && \
  echo "deb [signed-by=/usr/share/keyrings/nodesource.gpg] https://deb.nodesource.com/node_20.x lunar main" >>/etc/apt/sources.list.d/node.list && \
  curl -s https://deb.nodesource.com/gpgkey/nodesource.gpg.key | gpg --dearmor | tee /usr/share/keyrings/nodesource.gpg >/dev/null && \
  echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | tee /etc/apt/sources.list.d/docker.list > /dev/null && \
  curl -fsSL https://download.docker.com/linux/ubuntu/gpg | gpg --dearmor | tee /usr/share/keyrings/docker.gpg >/dev/null && \
  apt-get update && \
  apt-get install --no-install-recommends -y \
    docker-ce \
    docker-ce-cli \
    docker-buildx-plugin \
    nodejs  && \
  echo "**** cleanup ****" && \
  apt-get autoremove -y --purge && \
  apt-get clean && \
  rm -rf \
    /tmp/* \
    /root/.cache \
    /root/.npm
