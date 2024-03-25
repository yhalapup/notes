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

COPY ./notes/Gemfile* /usr/src/app/

COPY ./docker/entrypoints/web-entrypoint.sh /docker/entrypoints/web-entrypoint.sh
COPY ./docker/entrypoints/worker-entrypoint.sh /docker/entrypoints/worker-entrypoint.sh
COPY ./docker/entrypoints/worker-scheduler-entrypoint.sh /docker/entrypoints/worker-scheduler-entrypoint.sh
RUN chmod +x /docker/entrypoints/web-entrypoint.sh
RUN chmod +x /docker/entrypoints/worker-entrypoint.sh
RUN chmod +x /docker/entrypoints/worker-scheduler-entrypoint.sh
RUN chown ${USER}:${GROUP} -R docker/entrypoints/

WORKDIR /usr/src/app

COPY ./notes /usr/src/app/
RUN chown ${USER}:${GROUP} -R /usr/src/app/

RUN chown ${USER}:${GROUP} -R /usr/local/bundle

USER ${USER}

RUN bundle install --jobs 4 --retry 3
