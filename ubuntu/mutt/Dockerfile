FROM ubuntu:18.04
RUN apt-get update && apt-get -y install \
    git \
    curl \
    vim \
    automake \
    autoconf \
    pkg-config \
    build-essential \
    libevent-dev \
    libncurses5-dev \
 && rm -rf /var/lib/apt/lists/*
RUN groupadd -g 999 saj && \
    useradd -r -u 999 -g saj saj 
RUN mkdir -p /home/saj/git && chown saj:saj /home/saj/git
USER saj
WORKDIR /home/saj/git
ADD https://api.github.com/repos/muttmua/mutt/git/refs/heads/master version.json
RUN git clone https://gitlab.com/muttmua/mutt
WORKDIR /home/saj/git/mutt
RUN ./prepare --enable-imap
RUN ./configure && make
