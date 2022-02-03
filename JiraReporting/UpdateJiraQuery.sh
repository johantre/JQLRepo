#!/bin/sh

HOSTNAME="https://atc.bmwgroup.net/jira/rest/api/2/filter/"
EXTENSION="?expand"
PASS=$1
QUERYID=$2
PAYLOAD=$3

curl -u $(whoami):$PASS -X PUT --data "$PAYLOAD" -H "Content-Type: application/json" $HOSTNAME$QUERYID$EXTENSION
