ARG BASE_IMAGE="ghcr.io/gbraad-devenv/fedora/rdesktop"
ARG BASE_VERSION=41

FROM ${BASE_IMAGE}:${BASE_VERSION}

USER root

RUN dnf install -y \
        java-21-openjdk \
    && dnf clean all \
    && rm -rf /var/cache/yum

USER gbraad

RUN mkdir -p ~/Downloads ~/Applications/Cardforge \
    && cd ~/Downloads \
    && wget https://github.com/Card-Forge/forge/releases/download/forge-2.0.00/forge-installer-2.0.00.tar.bz2 -O forge-install.tar.bz2 \
    && tar -xjvf forge-install.tar.bz2 -C ~/Applications/Cardforge/ \
    && rm -f forge-install.tar.bz2 \
    && echo "exec ~/Applications/Cardforge/forge.sh " >> ~/.config/i3/config

# ensure to become root for systemd
USER root
#ENTRYPOINT ["/sbin/init"]
