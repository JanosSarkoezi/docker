FROM ubuntu:18.04
ENV DEBIAN_FRONTEND noninteractive
ENV TERM xterm
RUN ln -fs /usr/share/zoneinfo/Europe/Berlin /etc/localtime
RUN apt-get update && apt-get -y install \
    git \
    curl \
    vim \
    build-essential \
    x11proto-dev \
    libx11-dev \
    libxft-dev \
 && rm -rf /var/lib/apt/lists/*
ARG UID=999
ARG GID=999
RUN addgroup --gid ${GID} saj && \
    adduser --gecos "First Last,RoomNumber,WorkPhone,HomePhone" --disabled-password --uid ${UID} --ingroup saj -shell /bin/bash saj 
RUN mkdir -p /home/saj/git && chown saj:saj /home/saj/git
USER saj
WORKDIR /home/saj/git
ADD https://git.suckless.org/st/log.html log.html
RUN git clone git://git.suckless.org/st
WORKDIR /home/saj/git/st
RUN sed -i 's/char \*termname = "st-256color";/char \*termname = "xterm-256color";/g' config.def.h
RUN make
