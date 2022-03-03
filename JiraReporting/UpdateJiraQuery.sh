#!/bin/sh
HOSTNAME="https://atc.bmwgroup.net/jira/rest/api/2/filter/"
EXTENSION="?expand"
PASS=$1
QUERYID=$2
PAYLOAD=$3

printf "\n"
printf "queryId=$QUERYID"
printf "\n"
printf "payload=$PAYLOAD"
printf "\n"

curl -u $(whoami):$PASS -X PUT --data "$PAYLOAD" -H "Content-Type: application/json" $HOSTNAME$QUERYID$EXTENSION
