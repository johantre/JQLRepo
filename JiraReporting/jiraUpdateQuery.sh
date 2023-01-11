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
  echo "Query id = $QUERYID and payload = $PAYLOAD"
else
  echo "Query id = $QUERYID"
fi

if test -n "$GITHUB_OUTPUT"
then
  echo "Query id = $QUERYID and payload = $PAYLOAD" >> $GITHUB_OUTPUT
else
  echo "Daamn"
fi

printf "Why can we not printf to the console?"

curl -u "$JIRAUSER:$JIRAPASS" -X PUT --data "$PAYLOAD" -H "Content-Type: application/json" $HOSTNAME$QUERYID$EXTENSION
printf "\n"
