#!/bin/sh

set -e

if [ -f tmp/pids/server.pid ]; then
  rm tmp/pids/server.pid
fi

rake environment resque:scheduler RAILS_ENV=$RAILS_ENV
