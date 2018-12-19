FROM ubuntu:18.04
RUN apt-get update && apt-get -y install \
    git \
    vim \
    curl \
    python3 \
    avahi-daemon \
    avahi-discover \
    libnss-mdns \
    espeak \
    festival \
    vorbis-tools \
    sox \
    python3-dev \
    python3-pip \
    libffi-dev \
    libssl-dev \
 && rm -rf /var/lib/apt/lists/*
WORKDIR /opt
ADD https://api.github.com/repos/jromang/picochess/git/refs/heads/master version.json
RUN git clone --branch master https://github.com/jromang/picochess.git

WORKDIR /opt/picochess
RUN sed -i s/python-chess==0.22.1/python-chess==0.23.1/g requirements.txt
RUN pip3 install --upgrade -r requirements.txt
WORKDIR /opt/picochess/uci
RUN sed -i "67s/file, stderr=DEVNULL/file, encoding='utf-8', stderr=DEVNULL/g" engine.py
WORKDIR /opt/picochess
RUN python3 ./build/engines.py && python3 ./build/books.py && python3 ./build/voices.py
