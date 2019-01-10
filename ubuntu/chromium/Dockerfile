FROM ubuntu:18.04
ENV DEBIAN_FRONTEND noninteractive
ENV TERM xterm
RUN ln -fs /usr/share/zoneinfo/Europe/Berlin /etc/localtime

RUN apt-get update && apt-get install -y \
    chromium-browser \
    alsa-utils

ARG UID=999
ARG GID=999
RUN addgroup --gid ${GID} saj && \
    adduser --gecos "First Last,RoomNumber,WorkPhone,HomePhone" --disabled-password --uid ${UID} --ingroup saj -shell /bin/bash saj 

COPY sysctl.conf /etc/sysctl.conf

USER saj
ENV HOME /home/saj
# CMD /usr/bin/chromium-browser
