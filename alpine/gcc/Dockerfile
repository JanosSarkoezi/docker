FROM alpine
RUN apk add --update --no-cache \
    git \
    curl \
    vim \
    make \
    gcc \
    libc-dev
ARG UID
ARG GID
RUN addgroup -g ${GID} saj && \
    adduser -D -u ${UID} -G saj -s /bin/bash saj 
RUN mkdir -p /home/saj/git && chown saj:saj /home/saj/git
USER saj
WORKDIR /home/saj/git
