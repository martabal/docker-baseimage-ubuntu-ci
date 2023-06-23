FROM ubuntu:22.04

LABEL maintainer="martabal"

ENV DEBIAN_FRONTEND=noninteractive

RUN \
  apt-get update && \
  apt-get install --no-install-recommends -y \
    bash \
    build-essential \
    cargo \
    composer \
    coreutils \
    curl \
    gcc \
    jq \
    libpq-dev \
    nodejs \
    npm \
    openssh-client \
    php-tokenizer \
    python3 \
    python3-pip \
    rustc \
    libsqlite3-dev && \
  cargo install rustfmt && \
  echo "**** cleanup ****" && \
  apt-get autoremove -y --purge && \
  apt-get clean && \
  rm -rf \
    /tmp/* \
    /root/.cache \
    /root/.npm
