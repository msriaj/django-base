FROM ubuntu:bionic
ENV PYTHONBUFFERED=1
WORKDIR /app/server
RUN apt-get update && apt-get upgrade -y && apt-get install -y python3 python3-pip yarn && \
    touch /app/server/package.orig.json && \
    ln -sf /app/server/package.orig.json /app/package.json && \
    ln -sf /usr/bin/pip3 /usr/bin/pip && \
    ln -sf /usr/bin/python3 /usr/bin/python && \
    cd /app/ && yarn add babel-cli babel-preset-env babel-core babel-polyfill babel-preset-minify && cd /app/server && \
    rm -rv /var/cache/apt/archives
