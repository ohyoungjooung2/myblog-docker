#!/bin/sh
set -e

# Feel free to change any of the following variables for your env.
TIMEOUT=${TIMEOUT-60}
APP_ROOT=/myapp
PID=$APP_ROOT/tmp/pids/unicorn.pid
#BUNDLE="/home/oyj/.rubies/ruby-2.3.4/bin/bundle"
#cd $APP_ROOT; bundle exec unicorn -D -c $APP_ROOT/config/unicorn_docker.rb -E development
#cd $APP_ROOT; bundle exec unicorn -c $APP_ROOT/config/unicorn_docker.rb -E development
cd $APP_ROOT; bundle exec unicorn -D -c $APP_ROOT/config/unicorn_docker.rb -E production
