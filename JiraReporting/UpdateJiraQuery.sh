#!/bin/sh
DIR=$(dirname $0)
source "$DIR/lib/lib.sh"

jiraprops="$DIR/env/prod.jira.properties"

HOSTNAME=$(prop 'jira.host' $jiraprops)
EXTENSION=$(prop 'jira.extention' $jiraprops)
USERBASE64=$(prop 'jira.user.base64' $jiraprops)

QUERYID=$2
PAYLOAD=$3

printf "queryId=$QUERYID and payload=$PAYLOAD"
printf "\n"

echo curl -u qqmibi4:g#cZrpo8onqvaij -X PUT --data "$PAYLOAD" -H "Content-Type: application/json" $HOSTNAME$QUERYID$EXTENSION
printf "\n"

curl -u qqmibi4:g#cZrpo8onqvaij -X PUT --data "$PAYLOAD" -H "Content-Type: application/json" $HOSTNAME$QUERYID$EXTENSION



