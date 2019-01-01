FROM ubuntu:18.04
ENV DEBIAN_FRONTEND noninteractive
ENV TERM xterm
RUN ln -fs /usr/share/zoneinfo/Europe/Berlin /etc/localtime
RUN apt-get update && apt-get -y install \
    git \
    curl \
    make \
    gcc \
    libc6-dev \
    vim \
    texlive-games \
    texlive-latex-extra \
 && rm -rf /var/lib/apt/lists/*
ARG UID=999
ARG GID=999
RUN addgroup --gid ${GID} saj && \
    adduser --gecos "First Last,RoomNumber,WorkPhone,HomePhone" --disabled-password --uid ${UID} --ingroup saj -shell /bin/bash saj 
RUN mkdir -p /home/saj/git && chown saj:saj /home/saj/git

WORKDIR /tmp
RUN curl -LO http://mirrors.ctan.org/fonts/chess/enpassant.zip
RUN unzip enpassant.zip
RUN mkdir -p /usr/share/texlive/texmf-dist/fonts/tfm/enpassant   && cp enpassant/*.tfm /usr/share/texlive/texmf-dist/fonts/tfm/enpassant/ && \
    mkdir -p /usr/share/texlive/texmf-dist/fonts/type1/enpassant && cp enpassant/*.pfb /usr/share/texlive/texmf-dist/fonts/type1/enpassant/ && \
    mkdir -p /usr/share/texlive/texmf-dist/fonts/afm/enpassant   && cp enpassant/*.afm /usr/share/texlive/texmf-dist/fonts/afm/enpassant/ && \
    mkdir -p /usr/share/texlive/texmf-dist/fonts/enc/enpassant   && cp enpassant/*.enc /usr/share/texlive/texmf-dist/fonts/enc/enpassant/ && \
    mkdir -p /usr/share/texlive/texmf-dist/tex/latex/chessfss/enpassant && cp enpassant/*.fd /usr/share/texlive/texmf-dist/tex/latex/chessfss/enpassant/ && \
    cp enpassant/chess-enpassant.map /usr/share/texlive/texmf-dist/fonts/map/pdftex/updmap

COPY ttf2pt1-3.4.4.tgz /tmp
RUN tar xzf ttf2pt1-3.4.4.tgz && cd ttf2pt1-3.4.4 && make all && cp ttf2pt1 /usr/bin && cp t1asm /usr/bin
COPY merid_tt.zip /tmp
RUN unzip merid_tt.zip -d /tmp
WORKDIR /usr/share/texlive/texmf-dist/fonts/type1/enpassant
RUN cp /tmp/MERIFONT.TTF . && ttf2pt1 -b MERIFONT.TTF chess-merida-board-fig-raw && mv chess-merida-board-fig-raw.afm ../../afm/enpassant

RUN mktexlsr
RUN updmap -sys --enable Map=chess-enpassant.map
RUN rm -fr /tmp/*

USER saj
WORKDIR /home/saj/git
