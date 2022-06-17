#!/bin/sh
source lib.sh

HOSTNAME=$(prop 'jira.host' 'env/prod.jira.properties')
EXTENSION=$(prop 'jira.extention' 'env/prod.jira.properties')
PASS=$1
QUERYID=$2
PAYLOAD=$3

printf "\n"
printf "queryId=$QUERYID"
printf "\n"
printf "payload=$PAYLOAD"
printf "\n"

curl -u $(whoami):$PASS -X PUT --data "$PAYLOAD" -H "Content-Type: application/json" $HOSTNAME$QUERYID$EXTENSION
