FROM ubuntu:18.04
RUN apt-get update && \
    apt-get install -y software-properties-common && \
    add-apt-repository -y ppa:neovim-ppa/unstable && \
    apt-get update && apt-get -y install \
    git \
    curl \
    vim \
    neovim \
    make \
    cmake \
    xclip \
    python-dev \
    python-pip \
    python-setuptools \
    python3-dev \
    python3-pip \
    python3-setuptools \
    openjdk-8-jdk \
    build-essential \
    software-properties-common \
    --no-install-recommends \
 && rm -rf /var/lib/apt/lists/*
RUN groupadd -g 999 saj && \
    useradd -r -u 999 -g saj saj 
RUN mkdir -p /home/saj/.config/nvim/autoload && \ 
    mkdir -p /home/saj/git && \ 
    chown -R saj:saj /home/saj
USER saj
WORKDIR /home/saj/
RUN curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
COPY --chown=saj:saj init.vim /home/saj/.config/nvim
COPY --chown=saj:saj vimrc* /home/saj/.vim/
RUN pip3 install Wheel
RUN pip3 install --user neovim
RUN nvim +headless +PlugInstall +qall!
WORKDIR /home/saj/.vim/bundle/YouCompleteMe
RUN python3 install.py --java-complete
ENV HOME /home/saj
ENV DISPLAY :0
