FROM ubuntu:18.04
RUN apt-get update && apt-get -y install \
    git \
    curl \
    vim \
    make \
    cmake \
    xclip \
    python3-dev \
    openjdk-8-jdk \
    build-essential \
    --no-install-recommends \
 && rm -rf /var/lib/apt/lists/*
RUN groupadd -g 999 saj && \
    useradd -r -u 999 -g saj saj 
RUN mkdir -p /home/saj/.vim/autoload && \ 
    mkdir -p /home/saj/git && \ 
    chown saj:saj /home/saj && \
    chown saj:saj /home/saj/git && \
    chown saj:saj /home/saj/.vim && \
    chown saj:saj /home/saj/.vim/autoload
USER saj
WORKDIR /home/saj/
RUN curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
COPY --chown=saj:saj .vimrc /home/saj/.vimrc
COPY --chown=saj:saj vimrc* /home/saj/.vim/
RUN vim +PlugInstall +qall!
WORKDIR /home/saj/.vim/bundle/YouCompleteMe
RUN python3 install.py --java-complete
ENV HOME /home/saj
ENV DISPLAY :0
