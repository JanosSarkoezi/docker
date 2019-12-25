FROM alpine
RUN apk add --update --no-cache \
    autoconf \
    automake \
    curl \
    dpkg-dev \
    g++ \
    gcc \
    git \
    libc-dev \
    libpng-dev \
    make \
    ncurses-dev \
    pkgconfig \
    sdl-dev \
    sdl_image-dev \
    sdl_mixer-dev \
    python3 \
    py3-yaml \
    vim
ARG UID=999
ARG GID=999
RUN addgroup -g ${GID} saj && \
    adduser -D -u ${UID} -G saj -s /bin/bash saj 
RUN mkdir -p /home/saj/git && chown saj:saj /home/saj/git
RUN ln -s /usr/bin/python3 /usr/bin/python
USER saj
WORKDIR /home/saj/git
ADD https://api.github.com/repos/crawl/crawl/git/refs/heads/master verson.json
RUN git clone https://github.com/crawl/crawl.git
WORKDIR /home/saj/git/crawl
RUN git submodule update --init
WORKDIR /home/saj/git/crawl/crawl-ref/source
# RUN make TILES=y
