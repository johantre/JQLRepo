#!/bin/sh
source lib/lib.sh

HOSTNAME=$(prop 'jira.host' 'env/prod.jira.properties')
EXTENSION=$(prop 'jira.extention' 'env/prod.jira.properties')

QUERYID=$2
PAYLOAD=$3

printf "\n"
printf "queryId=$QUERYID"
printf "\n"
printf "payload=$PAYLOAD"

curl -H "Authorization: Basic UVhaMUlCTDpTdGVlbndlZzE2OTk4MTBOYXphcmV0aA==" -X PUT --data "$PAYLOAD" -H "Content-Type: application/json" $HOSTNAME$QUERYID$EXTENSION
