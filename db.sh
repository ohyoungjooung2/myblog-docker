#!/usr/bin/env bash
docker-compose rake db:create RAILS_ENV="production"
docker-compose rake db:migrate RAILS_ENV="production"
docker-compose rake db:seed RAILS_ENV="production"
docker-compose rake assets:precompile RAILS_ENV="production"


