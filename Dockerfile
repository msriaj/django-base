FROM ubuntu:bionic
ENV PYTHONBUFFERED=1 LANG=C.UTF-8 LANGUAGE=C.UTF-8 LC_ALL=C.UTF-8
WORKDIR /app/server
COPY package_install /usr/sbin/package_install
RUN chmod 755 /usr/sbin/package_install && \
    package_install python3 python3-pip curl apt-transport-https && \
    ln -sf /usr/bin/pip3 /usr/bin/pip && \
    ln -sf /usr/bin/python3 /usr/bin/python && \
    pip install pipenv
