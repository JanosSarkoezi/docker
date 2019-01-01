FROM ubuntu:18.04
ENV DEBIAN_FRONTEND noninteractive
ENV TERM xterm
RUN ln -fs /usr/share/zoneinfo/Europe/Berlin /etc/localtime
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
ARG UID=999
ARG GID=999
RUN addgroup --gid ${GID} saj && \
    adduser --gecos "First Last,RoomNumber,WorkPhone,HomePhone" --disabled-password --uid ${UID} --ingroup saj -shell /bin/bash saj 
RUN mkdir -p /home/saj/git && chown saj:saj /home/saj/git
USER saj
WORKDIR /home/saj/git
ADD https://api.github.com/repos/tmux/tmux/git/refs/heads/master version.json
RUN git clone https://github.com/tmux/tmux.git
WORKDIR /home/saj/git/tmux
RUN ./autogen.sh
RUN ./configure && make
