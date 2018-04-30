#!/usr/bin/env bash

start_solr(){
  bundle exec rake sunspot:solr:start RAILS_ENV="development"
  JOB="Staring solr gem search engine"
   
}

db_setup(){
   rake db:create && rake db:migrate && rake db:seed
}

start_rails_server(){
    JOB="STARTING RAILS DEVELOPMENT"
    #start_solr
    rails s -b 0.0.0.0 -p 3333
         
    #check
}



echo -e "\e[1;33m Starting rails development\e[0m"
db_setup
start_rails_server
