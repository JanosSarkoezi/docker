FROM alpine
RUN apk add --update --no-cache \
    git \
    curl \
    vim \
    make \
    gcc \
    libc-dev \
    texlive-full
# ENV PATH="/usr/share/texmf-dist/scripts/texlive:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:${PATH}"
ARG UID=999
ARG GID=999
RUN addgroup -g ${GID} saj && \
    adduser -D -u ${UID} -G saj -s /bin/bash saj 
RUN mkdir -p /home/saj/git && chown saj:saj /home/saj/git

RUN curl -LO http://mirrors.ctan.org/fonts/chess/enpassant.zip
RUN unzip enpassant.zip
RUN mkdir -p /usr/share/texmf-dist/fonts/tfm/enpassant && cp enpassant/*.tfm /usr/share/texmf-dist/fonts/tfm/enpassant/ && \
    mkdir -p /usr/share/texmf-dist/fonts/type1/enpassant && cp enpassant/*.pfb /usr/share/texmf-dist/fonts/type1/enpassant/ && \
    mkdir -p /usr/share/texmf-dist/fonts/afm/enpassant && cp enpassant/*.afm /usr/share/texmf-dist/fonts/afm/enpassant/ && \
    mkdir -p /usr/share/texmf-dist/fonts/enc/enpassant && cp enpassant/*.enc /usr/share/texmf-dist/fonts/enc/enpassant/ && \
    mkdir -p /usr/share/texmf-dist/tex/latex/chessfss/enpassant && cp enpassant/*.fd /usr/share/texmf-dist/tex/latex/chessfss/enpassant/ && \
    cp enpassant/chess-enpassant.map /usr/share/texmf-dist/fonts/map/pdftex/updmap
ENV TERM="xterm"
ENV PERL5LIB="/usr/share/texmf-dist/scripts/texlive"

COPY ttf2pt1-3.4.4.tgz /
RUN tar xzf ttf2pt1-3.4.4.tgz && cd /ttf2pt1-3.4.4/ && make install
COPY merid_tt.zip /
RUN unzip merid_tt.zip -d /tmp
WORKDIR /usr/share/texmf-dist/fonts/type1/enpassant
RUN cp /tmp/MERIFONT.TTF . && ttf2pt1 -b MERIFONT.TTF chess-merida-board-fig-raw && mv chess-merida-board-fig-raw.afm ../../afm/enpassant

RUN mktexlsr
RUN sed -i '/Map cherokee.map/d' /usr/share/texmf-dist/web2c/updmap.cfg
RUN sed -i '/Map oinuit.map/d' /usr/share/texmf-dist/web2c/updmap.cfg
RUN updmap -sys --enable Map=chess-enpassant.map

USER saj
WORKDIR /home/saj/git
ADD https://api.github.com/repos/tmux/tmux/git/refs/heads/master version.json
ADD https://api.github.com/repos/JanosSarkoezi/latex/git/refs/heads/master version.json
RUN git clone https://github.com/JanosSarkoezi/latex.git
WORKDIR /home/saj/git/latex
RUN git checkout chess
