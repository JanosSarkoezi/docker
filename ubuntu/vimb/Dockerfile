FROM ubuntu:18.04
ENV DEBIAN_FRONTEND noninteractive
ENV TERM xterm
RUN ln -fs /usr/share/zoneinfo/Europe/Berlin /etc/localtime
RUN apt-get update && apt-get -y install \
    git \
    curl \
    vim \
    dbus \
    automake \
    autoconf \
    pkg-config \
    build-essential \
    libgtk-3-dev \
    libwebkit2gtk-4.0-dev \
 && rm -rf /var/lib/apt/lists/*
ARG UID=999
ARG GID=999
RUN addgroup --gid ${GID} saj && \
    adduser --gecos "First Last,RoomNumber,WorkPhone,HomePhone" --disabled-password --uid ${UID} --ingroup saj -shell /bin/bash saj 
RUN mkdir -p /home/saj/git && chown saj:saj /home/saj/git
USER saj
WORKDIR /home/saj/git
ADD https://api.github.com/repos/fanglingsu/vimb/git/refs/heads/master version.json
RUN git clone https://github.com/fanglingsu/vimb
WORKDIR /home/saj/git/vimb
RUN make sandbox
ENTRYPOINT ["make", "runsandbox" ]
