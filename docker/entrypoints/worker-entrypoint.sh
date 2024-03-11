#!/bin/sh

set -e

echo "HELLO"
echo $REDIS_URL
resque-web -p 8000 -r $REDIS_URL
QUEUE=* rake environment resque:work
