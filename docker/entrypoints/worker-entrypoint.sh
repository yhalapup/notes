#!/bin/sh

set -e


echo "HELLO"
echo $REDIS_URL
resque-web -p 8000 -r $REDIS_URL
rake environment resque:work QUEUE=*
rake environment resque:scheduler
