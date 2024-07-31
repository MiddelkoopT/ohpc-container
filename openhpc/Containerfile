FROM registry.docker.com/library/rockylinux:9
LABEL maintainer="tmiddelkoop@internet2.edu"

ARG ARCH=aarch64
RUN dnf install -y http://repos.openhpc.community/OpenHPC/3/EL_9/$ARCH/ohpc-release-3-1.el9.$ARCH.rpm

RUN dnf install -y dnf-plugins-core && \
    dnf config-manager --set-enabled crb && \
    dnf upgrade -y && \
    dnf swap -y curl-minimal curl && \
    dnf install -y curl unzip jq procps-ng iproute bind-utils findutils && \
    dnf install -y ohpc-base

## Configure common image
RUN dnf install -y munge && \
    /usr/sbin/create-munge-key

ARG USER=auser
RUN useradd --create-home --shell=/bin/bash --user-group $USER
RUN install -v -dp --owner=$USER --group=$USER /data /scratch
