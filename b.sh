#!/usr/bin/env bash

start_solr(){
  bundle exec rake sunspot:solr:start RAILS_ENV="development"
  JOB="Staring solr gem search engine"
   
}

start_rails_server(){
    JOB="STARTING RAILS DEVELOPMENT"
    start_solr
    rails s -b 0.0.0.0 -p 3333
         
    #check
}


echo -e "\e[1;33m Starting solr and rails development\e[0m"

start_rails_server
