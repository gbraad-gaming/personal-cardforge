ARG BASE_IMAGE="ghcr.io/gbraad-devenv/fedora/rdesktop"
ARG BASE_VERSION=41

FROM ${BASE_IMAGE}:${BASE_VERSION}

USER root

RUN dnf install -y \
        java-21-openjdk \
    && dnf clean all \
    && rm -rf /var/cache/yum

RUN mkdir -p /opt/cardforge \
    && cd /tmp \
    && wget https://github.com/Card-Forge/forge/releases/download/forge-2.0.00/forge-installer-2.0.00.tar.bz2 \
        -O forge-install.tar.bz2 \
    && tar -xjvf forge-install.tar.bz2 -C /opt/cardforge/ \
    && rm -f forge-install.tar.bz2 \
    && git config -f /etc/rdesktop/rdesktop.ini rdesktop.title "Personal (Card)Forge" \
    && git config -f /etc/rdesktop/rdesktop.ini rdesktop.exec "/opt/cardforge/forge.sh"

#ENTRYPOINT ["/sbin/init"]
