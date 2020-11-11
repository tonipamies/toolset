FROM alpine:edge
LABEL maintainer="Ansible <info@ansible.com>"

ENV PACKAGES="\
ansible \
docker \
git \
gcc \
openssh-client \
docker-py \
libc-dev \
libffi-dev \
libsodium \
openssl-dev \
libvirt \
rsync \
py3-pip \
python3 \
python3-dev \
"

# ENV BUILD_DEPS="\
# gcc \
# libc-dev \
# libvirt-dev \
# make \
# "

ENV PIP_INSTALL_ARGS="--pre"

RUN \
apk add --update --no-cache \
${BUILD_DEPS} ${PACKAGES} \
&& apk del --no-cache ${BUILD_DEPS} \
&& rm -rf /root/.cache

COPY requirements.txt /tmp/requirements.txt

RUN \
python3 -m pip install \
${PIP_INSTALL_ARGS} -r /tmp/requirements.txt && \
molecule --version && \
molecule drivers && \
python3 -m pip check
# running molecule commands adds a minimal level fail-safe about build success

ENV SHELL /bin/bash
