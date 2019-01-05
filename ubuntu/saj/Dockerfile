FROM ubuntu:18.04
ENV DEBIAN_FRONTEND noninteractive
ENV TERM xterm
RUN ln -fs /usr/share/zoneinfo/Europe/Berlin /etc/localtime
RUN apt-get update && apt-get -y install \
    sudo \
 && rm -rf /var/lib/apt/lists/*
ARG UID=999
ARG GID=999
RUN addgroup --gid ${GID} saj && \
    adduser --gecos "First Last,RoomNumber,WorkPhone,HomePhone" --disabled-password --uid ${UID} --ingroup saj -shell /bin/bash saj 
RUN adduser saj sudo
RUN echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers
COPY scripts/apt-get.sh /home/saj
RUN chown -R saj:saj /home/saj/apt-get.sh && chmod 744 /home/saj/apt-get.sh

USER saj
WORKDIR /home/saj/
RUN sudo ./apt-get.sh
COPY --chown=saj:saj scripts/ /home/saj
RUN chmod 744 /home/saj/*.sh
RUN ./create_env.sh
RUN ./create_tmux.sh
RUN ./create_st.sh
# ENTRYPOINT [ "zsh", "-c", "source ~/.profile" ]
ENTRYPOINT [ "zsh" ]

