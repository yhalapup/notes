#!/bin/sh

set -e

rake environment resque:scheduler RAILS_ENV=$RAILS_ENV
