FROM python:3.11-slim-bookworm
ENV PYTHONBUFFERED=1 \
    LANG=C.UTF-8 \
    LANGUAGE=C.UTF-8 \
    LC_ALL=C.UTF-8 \
    DEBIAN_FRONTEND=noninteractive \
    TZ=Asia/Dhaka \
    PDM_USE_VENV=false
WORKDIR /app/server
COPY package_install package_dist_upgrade /usr/sbin/
RUN chmod 755 /usr/sbin/package_install /usr/sbin/package_dist_upgrade && \
    package_dist_upgrade && \
    pip install pdm
