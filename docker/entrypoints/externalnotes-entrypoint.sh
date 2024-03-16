#!/bin/sh

set -e

bundle exec rackup -p 4567 -o 0.0.0.0
