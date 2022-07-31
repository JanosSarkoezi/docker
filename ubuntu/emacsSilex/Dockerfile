FROM silex/emacs:latest

RUN apt-get update && apt-get install -y \
  git \
  default-jdk

# Replace 1000 with your user / group id
ARG UID=999
ARG GID=999
RUN addgroup --gid ${GID} saj && \
    adduser --gecos "First Last,RoomNumber,WorkPhone,HomePhone" --disabled-password --uid ${UID} --ingroup saj -shell /bin/bash saj 

USER saj
ENV HOME /home/saj
CMD ["emacs"]
