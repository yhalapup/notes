FROM ruby:3.2

ARG USER=appuser
ARG GROUP=appuser
ARG USER_ID
ARG GROUP_ID

RUN if [ ${USER_ID:-0} -ne 0 ] && [ ${GROUP_ID:-0} -ne 0 ]; then \
  groupadd -g ${GROUP_ID} ${GROUP} &&\
  useradd -u ${USER_ID} -g ${GROUP} -s /bin/sh -m ${USER} \
;fi

RUN apt-get update -qq && \
    apt-get install --no-install-recommends -y build-essential default-libmysqlclient-dev git libvips pkg-config

COPY ./externalnotes/Gemfile* /usr/src/app/

COPY ./docker/entrypoints/externalnotes-entrypoint.sh  /docker/entrypoints/externalnotes-entrypoint.sh
RUN chmod +x /docker/entrypoints/externalnotes-entrypoint.sh
RUN chown ${USER}:${GROUP} /docker/entrypoints/externalnotes-entrypoint.sh

WORKDIR /usr/src/app

COPY ./externalnotes /usr/src/app/

RUN chown ${USER}:${GROUP} -R /usr/src/app/

USER ${USER}

RUN bundle install --jobs 4 --retry 3
