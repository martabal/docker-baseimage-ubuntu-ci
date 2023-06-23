FROM ubuntu:lunar

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
