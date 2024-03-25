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

COPY ./docker/entrypoints/apidocumentation-entrypoint.sh /docker/entrypoints/apidocumentation-entrypoint.sh

RUN chmod +x /docker/entrypoints/apidocumentation-entrypoint.sh

WORKDIR /usr/src/app

COPY ./apidocumentation /usr/src/app
RUN chown ${USER}:${GROUP} -R /usr/src/app/

RUN chown ${USER}:${GROUP} -R /usr/local/src

USER ${USER}

RUN npm install

RUN npx @redocly/cli build-docs openapi.json  --output=/usr/local/src/index.html
