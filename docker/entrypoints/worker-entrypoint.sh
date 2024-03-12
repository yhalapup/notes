#!/bin/sh

set -e

resque-web -p 8000 -r $REDIS_URL
rake environment resque:work QUEUE=*
rake environment resque:scheduler
