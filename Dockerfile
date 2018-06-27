FROM alpine:3.7
ENV PYTHONBUFFERED=1
WORKDIR /app/server
RUN apk add --no-cache python3 py3-psycopg2 py3-pillow libsass yarn && \
    ln -sf /usr/bin/pip3 /usr/bin/pip && \
    ln -sf /usr/bin/python3 /usr/bin/python && \
    cd /app/ && yarn add babel-cli babel-preset-env babel-core babel-polyfill babel-preset-minify && cd /app/server
