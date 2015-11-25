#!/usr/bin/env bash
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
  if [[ "$#" -eq "0" ]]
  then
    echo "binding address is not exist, so go to default"
    rails s
  elif [[ $1 ]]
  then
    echo "binding addre is $1"
    rails s -b $1
  fi
  JOB="STARTING RAILS DEVELOPMENT"
  
  check
}


echo "\e[34mStarting solr and rails development"

kill_solr
start_solr
start_rails_server $1
