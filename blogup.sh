#!/usr/bin/env bash
ipaddr=$(ifconfig | grep inet | head -3 | tail -1 | awk -F':' '{print $2}' | awk  '{print $1}')
check(){
   RV=$?
   if  [[ $RV != "0" ]]
   then
       echo -e "\e[1;31m $JOB failed please check\e[0m"
       exit $RV
   else
       echo -e "\e[1;34m $JOB successful\e[0m"
   fi
}


kill_solr(){
  SOLR_PID=$(ps -ef | grep solr | grep java | awk  '{print $2}' | head -1)
  if [[  $SOLR_PID  ]]
  then
  kill -9 $SOLR_PID
  JOB="killing solr"
  check
  else
   echo "Solr is not running"
  fi
} 
start_solr(){
  rake sunspot:solr:start
  JOB="Staring solr gem search engine"
  check
}

start_rails_server(){
    JOB="STARTING RAILS DEVELOPMENT"
    kill_solr
    start_solr
    rails s -b $ipaddr -p 3333
    #check
}


echo -e "\e[1;33m Starting solr and rails development\e[0m"
start_rails_server
