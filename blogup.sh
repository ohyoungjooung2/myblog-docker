#!/usr/bin/env bash
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
  SOLR_PID=$(ps -ef | grep solr | grep java | awk  '{print $2}' | head -1)
  if [[  $SOLR_PID  ]]
  then
  kill -9 $SOLR_PID
  kill_solr
  JOB="killing solr"
  check
  else
   echo "Solr is not running"
  fi
  set +x
} 
start_solr(){
  bundle exec rake sunspot:solr:start RAILS_ENV="development"
  JOB="Staring solr gem search engine"
   
}

start_rails_server(){
    JOB="STARTING RAILS DEVELOPMENT"
    kill_solr
    start_solr

     sec=0
     echo "Solr port 8982 is still opening,wait please "
     tput sc
     while true 
     do
       #netstat -an | grep 8982 2>&1 /dev/null
       c=$(netstat -an | grep 8982)
       if [[ ! $c ]]
       then
         let sec++
         tput rc
         tput ed
         echo -n $sec
       elif [[ $c ]]
       then
         echo "Solr opend port 8982!"
         echo "Now start rails!"
         rails s -b 0.0.0.0 -p 3333
         exit 0
       else
         echo "something out?????();"
       fi
     done
         
    #check
}


echo -e "\e[1;33m Starting solr and rails development\e[0m"

start_rails_server
