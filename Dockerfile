FROM ubuntu:22.04

LABEL maintainer="martabal"

ENV DEBIAN_FRONTEND=noninteractive

RUN \
  echo "deb [signed-by=/usr/share/keyrings/nodesource.gpg] https://deb.nodesource.com/node_20.x jammy main" >>/etc/apt/sources.list.d/node.list && \
  curl -s https://deb.nodesource.com/gpgkey/nodesource.gpg.key | gpg --dearmor | tee /usr/share/keyrings/nodesource.gpg >/dev/null && \
  apt-get update && \
  apt-get install --no-install-recommends -y \
    bash \
    build-essential \
    cargo \
    composer \
    coreutils \
    curl \
    git \
    jq \
    libpq-dev \
    nodejs \
    npm \
    openssh-client \
    php-tokenizer \
    python3 \
    python3-pip \
    rustc \
    rustfmt \
    libsqlite3-dev && \
  echo "**** cleanup ****" && \
  apt-get autoremove -y --purge && \
  apt-get clean && \
  rm -rf \
    /tmp/* \
    /root/.cache \
    /root/.npm
