FROM kalilinux/kali-rolling
ENV DEBIAN_FRONTEND noninteractive
ENV TERM xterm
RUN ln -fs /usr/share/zoneinfo/Europe/Berlin /etc/localtime
# RUN apt-get update && apt-get dist-upgrade && apt-get autoremove && apt-get clean && apt-get -y install \
RUN apt-get update && apt-get -y install \
    kali-tools-top10 \
 && rm -rf /var/lib/apt/lists/*
ARG UID=999
ARG GID=999
RUN addgroup --gid ${GID} saj && \
    adduser --gecos "First Last,RoomNumber,WorkPhone,HomePhone" --disabled-password --uid ${UID} --ingroup saj -shell /bin/bash saj 
RUN mkdir -p /home/saj/git && chown saj:saj /home/saj/git
USER saj
WORKDIR /home/saj/git
WORKDIR /home/saj/sandbox
