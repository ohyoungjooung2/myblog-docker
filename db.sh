#!/usr/bin/env bash
docker-compose rake db:create
docker-compose rake db:migrate
docker-compose rake db:seed

