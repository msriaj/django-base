FROM ubuntu:bionic
ENV PYTHONBUFFERED=1
WORKDIR /app/server
COPY package_install /usr/sbin/package_install
RUN chmod 755 /usr/sbin/package_install && \
    package_install python3 python3-pip curl apt-transport-https && \
    curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
    echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list && \
    package_install -y yarn && \
    ln -sf /usr/bin/pip3 /usr/bin/pip && \
    ln -sf /usr/bin/python3 /usr/bin/python && \
    cd /app/ && yarn add babel-cli babel-preset-env babel-core babel-polyfill babel-preset-minify && cd /app/server && \
    mv /app/package.json /app/server/package.orig.json && ln -s /app/server/package.orig.json /app/package.json && \
    apt-get clean
