FROM ubuntu:18.04
RUN apt-get update && \
    apt-get install -y software-properties-common && \
    add-apt-repository -y ppa:neovim-ppa/unstable && \
    apt-get update && apt-get -y install \
    autoconf \
    automake \
    build-essential \
    cmake \
    curl \
    git \
    libevent-dev \
    libncurses5-dev \
    make \
    neovim \
    openjdk-8-jdk \
    pkg-config \
    python3-dev \
    python3-pip \
    python3-setuptools \
    python-dev \
    python-pip \
    python-setuptools \
    software-properties-common \
    vim \
    xclip \
    --no-install-recommends \
 && rm -rf /var/lib/apt/lists/*
ARG UID=1982
ARG GID=1982
RUN groupadd -g $GID saj
RUN useradd -m -u $UID -g $GID -o -s /bin/bash saj
RUN mkdir -p /home/saj/git && \ 
    chown -R saj:saj /home/saj
USER saj
WORKDIR /home/saj
RUN curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
RUN curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
COPY --chown=saj:saj init.vim /home/saj/.config/nvim/init.vim
COPY --chown=saj:saj .vimrc /home/saj/.vimrc
COPY --chown=saj:saj vimrc* /home/saj/.vim/
RUN pip3 install Wheel
RUN pip3 install --user neovim
RUN vim +PlugInstall +qall!
RUN nvim --headless +PlugInstall +qall!

WORKDIR /home/saj/git
ADD https://api.github.com/repos/tmux/tmux/git/refs/heads/master version.json
RUN git clone https://github.com/tmux/tmux.git
WORKDIR /home/saj/git/tmux
RUN ./autogen.sh
RUN ./configure && make

ENV HOME /home/saj
ENV DISPLAY :0
