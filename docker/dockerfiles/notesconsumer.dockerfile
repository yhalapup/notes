FROM node:20.11

ARG USER=appuser
ARG GROUP=appuser
ARG USER_ID
ARG GROUP_ID

RUN userdel -r node

RUN if [ ${USER_ID:-0} -ne 0 ] && [ ${GROUP_ID:-0} -ne 0 ]; then \
  groupadd -g ${GROUP_ID} ${GROUP} &&\
  useradd -u ${USER_ID} -g ${GROUP} -s /bin/sh -m ${USER} \
;fi

WORKDIR /usr/src/app

COPY ./notesconsumer /usr/src/app
RUN chown ${USER}:${GROUP} -R /usr/src/app/

RUN chmod +x ./curl/*.sh

USER ${USER}

RUN npm install
