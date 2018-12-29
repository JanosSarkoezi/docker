FROM alpine
RUN apk add --update --no-cache \
    git \
    curl \
    vim \
    automake \
    autoconf \
    pkgconfig \
    make \
    g++ \
    gcc \
    dpkg-dev \
    libc-dev \
    libevent-dev \
    ncurses-dev
ARG UID=999
ARG GID=999
RUN addgroup -g ${GID} saj && \
    adduser -D -u ${UID} -G saj -s /bin/bash saj 
RUN mkdir -p /home/saj/git && chown saj:saj /home/saj/git
USER saj
WORKDIR /home/saj/git
ADD https://api.github.com/repos/tmux/tmux/git/refs/heads/master version.json
RUN git clone https://github.com/tmux/tmux.git
WORKDIR /home/saj/git/tmux
RUN ./autogen.sh
RUN ./configure && make
