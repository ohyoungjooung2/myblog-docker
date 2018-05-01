#!/usr/bin/env bash
docker-compose run web rake db:create RAILS_ENV="production"
docker-compose run web rake db:migrate RAILS_ENV="production"
docker-compose run web rake db:seed RAILS_ENV="production"
docker-compose run web rake assets:precompile RAILS_ENV="production"


