#!/bin/sh
DIR=$(dirname $0)
source "$DIR/lib/lib.sh"
jiraprops="$DIR/env/prod.jira.properties"

HOSTNAME=$(prop 'jira.host' $jiraprops)
EXTENSION=$(prop 'jira.extension' $jiraprops)

if test -z "$JIRAUSER"
then
  echo "Falling back to $DIR/env/prod.jira.secret.properties fore credentials"
  jirasecretprops="$DIR/env/prod.jira.secret.properties"
  JIRAUSER=$(prop 'jira.user' $jirasecretprops)
  JIRAPASS=$(prop 'jira.pass' $jirasecretprops)
fi

QUERYID=$2
PAYLOAD=$3

#curl -u "$JIRAUSER:$JIRAPASS" -X PUT --data "$PAYLOAD" -H "Content-Type: application/json" $HOSTNAME$QUERYID$EXTENSION

