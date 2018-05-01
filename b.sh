#!/usr/bin/env bash
start_rails_server(){
    JOB="STARTING RAILS DEVELOPMENT"
    #start_solr
    #rails s -b 0.0.0.0 -p 3333
    if [[ -e /myapp/tmp/pids/unicorn.pid ]]
    then
       echo -e "\e[1;33m removing stald pid of tmp/pids/unicorn.pid \e[0m"
       rm -vf /myapp/tmp/pids/unicorn.pid
    fi
     
    echo -e "\e[1;33m making tmp/pids directory for unicorn \e[0m"
    mkdir -p /myapp/tmp/pids
    cd /myapp/config
    echo $PWD
    ./unicorn_docker.sh &
    /usr/sbin/nginx -g "daemon off;"         
    #check
}



echo -e "\e[1;33m Starting rails \e[0m"
##db_setup
start_rails_server
