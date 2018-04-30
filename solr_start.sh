#!/usr/bin/env bash
BUNDLE="/home/oyj/rails_root/myblog/bin/bundle"
ipaddr=$(ifconfig | grep inet | head -3 | tail -1 | awk -F':' '{print $2}' | awk  '{print $1}')
check(){
   RV=$?
   if  [[ $RV != "0" ]]
   then
       echo -e "\e[1;31m $JOB failed please check\e[0m"
       exit $RV
   else
       echo -e "\e[1;34m $JOB is(was) successful\e[0m"
   fi
}


kill_solr(){
  set -x
     $BUNDLE exec rake sunspot:solr:stop RAILS_ENV="production"
  JOB="killing solr"
  check
  set +x
} 
start_solr(){
  #bundle exec rake sunspot:solr:start RAILS_ENV="production"
  cd /home/oyj/rails_root/myblog;
  $BUNDLE exec rake sunspot:solr:start RAILS_ENV="production"
  JOB="Staring solr gem search engine"
  check
}

start_rails_server(){
    JOB="STARTING RAILS production"
    kill_solr
    start_solr
    #rails s -b $ipaddr -p 3333
    check
}


echo -e "\e[1;33m Starting solr and rails production\e[0m"
start_rails_server
