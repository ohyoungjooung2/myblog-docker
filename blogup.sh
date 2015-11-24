#!/usr/bin/env bash
#git test insert
check(){
   RV=$?
   if  [[ $RV != "0" ]]
   then
       echo -e "\e[31m $JOB failed please check"
       exit $RV
   else
       echo -e "\e[34m $JOB successful"
   fi
}

kill_solr(){
SOLR_PID=$(ps -ef | grep solr | awk  '{print $2}' | head -1)
  if [[ $? == "0"  ]]
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
  rails s
  JOB="STARTING RAILS DEVELOPMENT"
  check
}

echo "\e[34mStarting solr and rails development"

kill_solr
start_solr
start_rails_server
