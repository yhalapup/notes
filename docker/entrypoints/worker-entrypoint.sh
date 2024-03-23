#!/bin/sh

set -e

if [ -f tmp/pids/server.pid ]; then
  rm tmp/pids/server.pid
fi

resque-web -p 8000 -r $REDIS_URL
rake environment resque:work QUEUE=*
