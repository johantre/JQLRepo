#!/bin/sh
DIR=$(dirname $0)
source "$DIR/lib/lib.sh"

jiraprops="$DIR/env/prod.jira.properties"

HOSTNAME=$(prop 'jira.host' $jiraprops)
EXTENSION=$(prop 'jira.extention' $jiraprops)
USERBASE64=$(prop 'jira.user.base64' $jiraprops)

QUERYID=$2
PAYLOAD=$3

printf "\n"
printf "queryId=$QUERYID"
printf "\n"
printf "payload=$PAYLOAD"

curl -H "Authorization: Basic $USERBASE64==" -X PUT --data "$PAYLOAD" -H "Content-Type: application/json" $HOSTNAME$QUERYID$EXTENSION
