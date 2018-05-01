#!/usr/bin/env bash
start_rails_server(){
    JOB="STARTING RAILS DEVELOPMENT"
    #start_solr
    #rails s -b 0.0.0.0 -p 3333
    cd /myapp/config
    echo $PWD
    ./unicorn_docker.sh &
    /usr/sbin/nginx -g "daemon off;"         
    #check
}



echo -e "\e[1;33m Starting rails \e[0m"
##db_setup
start_rails_server
