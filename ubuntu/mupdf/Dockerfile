FROM ubuntu:18.04
ENV DEBIAN_FRONTEND noninteractive
ENV TERM xterm
RUN ln -fs /usr/share/zoneinfo/Europe/Berlin /etc/localtime
RUN apt-get update && apt-get -y install \
    build-essential \
    curl \
    git \
    libglu1-mesa-dev \
    libxi-dev \
    libxrandr-dev \
    mesa-common-dev \
    vim \
 && rm -rf /var/lib/apt/lists/*
ARG UID=999
ARG GID=999
RUN addgroup --gid ${GID} saj && \
    adduser --gecos "First Last,RoomNumber,WorkPhone,HomePhone" --disabled-password --uid ${UID} --ingroup saj -shell /bin/bash saj 
RUN mkdir -p /home/saj/git && chown saj:saj /home/saj/git
USER saj
WORKDIR /home/saj/git
RUN git clone --recursive git://git.ghostscript.com/mupdf.git
WORKDIR /home/saj/git/mupdf
RUN make
