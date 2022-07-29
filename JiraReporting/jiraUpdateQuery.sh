#!/bin/sh
DIR=$(dirname $0)
source "$DIR/lib/lib.sh"
jiraprops="$DIR/env/prod.jira.properties"
jirasecretprops="$DIR/env/prod.jira.secret.properties"

HOSTNAME=$(prop 'jira.host' $jiraprops)
EXTENSION=$(prop 'jira.extension' $jiraprops)
DEBUGFLAG=$(prop 'jira.debug' $jirasecretprops)

if test -z "$JIRAUSER"
then
  echo "Falling back to $DIR/env/prod.jira.secret.properties fore credentials"
  JIRAUSER=$(prop 'jira.user' $jirasecretprops)
  JIRAPASS=$(prop 'jira.pass' $jirasecretprops)
fi

QUERYID=$2
PAYLOAD=$3

if test -n "$DEBUGFLAG"
then
  printf "query id = $QUERYID and payload = $PAYLOAD"
  printf "\n"
fi

curl -u "$JIRAUSER:$JIRAPASS" -X PUT --data "$PAYLOAD" -H "Content-Type: application/json" $HOSTNAME$QUERYID$EXTENSION
printf "\n"
