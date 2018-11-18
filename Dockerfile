FROM ubuntu:bionic
ENV PYTHONBUFFERED=1
WORKDIR /app/server
COPY package_install /usr/sbin/package_install
RUN chmod 755 /usr/sbin/package_install && \
    package_install python3 python3-pip curl apt-transport-https locales && \
    ln -sf /usr/bin/pip3 /usr/bin/pip && \
    ln -sf /usr/bin/python3 /usr/bin/python

ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8
