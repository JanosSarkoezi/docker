FROM ubuntu:18.04
ENV DEBIAN_FRONTEND noninteractive
ENV TERM xterm
RUN ln -fs /usr/share/zoneinfo/Europe/Berlin /etc/localtime
RUN apt-get update && apt-get install -y \
    wget \
    vim \
    libnotify4 \
    libgconf-2-4 \
    libnss3 \
    libgtk2.0-0 \
    libxss1 \
    libgconf-2-4 \
    libasound2 \
    libxtst6 \
    libcanberra-gtk-dev \
    libgl1-mesa-glx \
    libgl1-mesa-dri \
    libxkbfile1 \
    libsecret-1-0 \
    openjdk-8-jdk \
 && rm -rf /var/lib/apt/lists/*
RUN wget https://go.microsoft.com/fwlink/?LinkID=760868 -O vscode.deb && \
    dpkg -i vscode.deb && \
    rm vscode.deb && \
    useradd -m vscode -s /bin/bash

WORKDIR /home/vscode

USER vscode
RUN code --extensions-dir 
RUN code --install-extension vscjava.vscode-java-debug
RUN code --install-extension vscjava.vscode-maven
RUN mkdir -p git
WORKDIR /home/vscode/git
CMD code --verbose --disable-gpu
