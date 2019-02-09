#!/usr/bin/env bash

pull_latest() {
  git pull
}

bootstrap_rails() {
  gem install bundler
  gem install pg -v '1.0.0'
  bundle install --path=vendor/bundle
  bin/rails db:setup
}

rebuild_rails() {
  bundle install
  bundle exec rake assets:clean assets:precompile
  restart_app
}

restart_app() {
  if ps -efw | grep "puma" | grep -v grep; then
    # Found a puma process, restart it gracefully
    pid=$(<"/tmp/puma.pid")
    kill -SIGUSR2 $pid
  else
    # We could not find a unicorn master process running, lets start one up!
    bundle exec puma &
  fi
}

scheduled_jobs() {
  if [ -z ${RAILS_ENV+x} ]; then
    source ~/.bashrc
  fi
}


cd "$(dirname "$0")"/..

allowed_commands="pull_latest bootstrap_rails rebuild_rails restart_app scheduled_jobs"
source scripts/_parse_args.sh
