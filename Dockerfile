FROM ubuntu:16.04

# Author and Docker Image information.
LABEL maintainer="hrvoje.varga@gmail.com"
LABEL build="./scripts/build-vscode-hugo-docker.sh"
LABEL run="./scripts/run-vscode-hugo-docker.sh"

# Install necessary packages.
RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install --no-install-recommends -y \
    curl ca-certificates git libgtk2.0 libgconf-2-4 libnss3 libxtst6 ssh-client \
    libcanberra-gtk-module libgl1-mesa-glx libxss1 sudo firefox xdg-utils vim

# Create user.
RUN addgroup --gid 1000 docker && \
    adduser --uid 1000 --ingroup docker --home /home/docker --shell /bin/bash --disabled-password --gecos "" docker && \
    usermod -a -G sudo docker && \
    echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

# Install Visual Studio Code.
RUN curl -L https://go.microsoft.com/fwlink/?LinkID=760868 -o /tmp/vscode.deb && \
    apt install -y /tmp/vscode.deb && \
    rm -f /tmp/vscode.deb

COPY files/vscode-config.json /tmp/vscode-config.json

# Instal Git LFS.
RUN curl -s https://packagecloud.io/install/repositories/github/git-lfs/script.deb.sh | sudo bash && \
    apt install -y git-lfs

# Remove cached packages.
RUN rm -rf /var/lib/apt/lists/*

# Install hugo.
RUN curl -L https://github.com/gohugoio/hugo/releases/download/v0.42.2/hugo_0.42.2_Linux-64bit.deb -o /tmp/hugo.deb && \
    apt install -y /tmp/hugo.deb && \
    rm -f /tmp/hugo.deb

# Install fixuid.
RUN curl -SsL https://github.com/boxboat/fixuid/releases/download/v0.4/fixuid-0.4-linux-amd64.tar.gz | tar -C /usr/local/bin -xzf - && \
    chown root:root /usr/local/bin/fixuid && \
    chmod 4755 /usr/local/bin/fixuid && \
    mkdir -p /etc/fixuid
COPY files/fixuid-config.yml /etc/fixuid/config.yml

# Switch user.
USER docker:docker

# Set working directory.
WORKDIR /home/docker

# Fix user permissions.
ENTRYPOINT ["fixuid"]

# Initialize environment and start shell.
COPY files/initialize_environment.sh /usr/local/bin
CMD initialize_environment.sh;bash
