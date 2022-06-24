#!/bin/sh
source lib/lib.sh

UPDATEJIRAQUERY=$(prop 'update.sh' 'env/prod.update.properties')
JQCOMMAND=$(prop 'update.jq.command' 'env/prod.update.properties')

read -s -p "type in your Q-account pass:" pass 
printf "\n"
read -p "type the name of your Jira Filter Query:" filterName 
printf "\n"
read -p "type the name of your .json file to search in:" JSONQUERYFILE 
printf "\n"
printf "Searching for filter w name = $filterName in $JSONQUERYFILE"
printf "\n"
printf "\n"

$JQCOMMAND -c -r --arg name "$filterName" \
		'.FilterQueries[] | if .Data.name == $name then .Id, .Data else empty end' "$JSONQUERYFILE" \
		| sed 's/"/\"/g' \
		| xargs -d '\n' \
		bash $UPDATEJIRAQUERY $1 $2 $pass

#comments by line:

#$filtername given to jq through --arg name $filterName, the var "$name" can be used in the filterquery.
#json filterquery (search $name, if found navigate it's .Id and .Data else return empty) from $JSONQUERYFILE
#assure quotes are skipped in above result
#transform results into arguments w xargs (delimiter = '\n')
#execute updateJiraQuery.sh w arguments $1 $2 $pass 
