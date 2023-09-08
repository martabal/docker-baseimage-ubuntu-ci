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
    fonts-liberation \
    gconf-service \
    git \
    gnupg \
    jq \
    libappindicator1 \
    libasound2 \
    libatk1.0-0 \
    libcairo2 \
    libcups2 \
    libfontconfig1 \
    libgbm-dev \
    libgdk-pixbuf2.0-0 \
    libgtk-3-0 \
    libicu-dev \
    libimage-exiftool-perl \
    libjpeg-dev \
    libnspr4 \
    libnss3 \
    libpango-1.0-0 \
    libpangocairo-1.0-0 \
    libpng-dev \
    libpq-dev \
    libsqlite3-dev \
    libx11-6 \
    libx11-xcb1 \
    libxcb1 \
    libxcomposite1 \
    libxcursor1 \
    libxdamage1 \
    libxext6 \
    libxfixes3 \
    libxi6 \
    libxrandr2 \
    libxrender1 \
    libxss1 \
    libxtst6 \
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
    software-properties-common \
    xdg-utils  && \
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
