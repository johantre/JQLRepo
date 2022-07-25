#!/bin/sh
DIR=$(dirname $0)
source "$DIR/lib/lib.sh"

prodprops="$DIR/env/prod.update.properties"

UPDATEJIRAQUERY=$(prop 'update.sh' $prodprops)
JQCOMMAND=$(prop 'update.jq.command' $prodprops)

read -p "type the name of your Jira Filter Query:" filterName 
printf "\n"
read -p "type the name of your .json file to search in:" JSONQUERYFILE 
printf "\n"
printf "Searching for filter w name = $filterName in $DIR/payload/$JSONQUERYFILE"
printf "\n"

	argsExecCmd=(-c -r --arg name "$filterName" '.FilterQueries[] | if .Data.name == $name then .Id, .Data else empty end' "$DIR/payload/$JSONQUERYFILE")
	$JQCOMMAND "${argsExecCmd[@]}" \
			| sed 's/"/\"/g' \
			| xargs -d '\n' \
			bash $DIR"/"$UPDATEJIRAQUERY

#comments by line:

#$filtername given to jq through --arg name $filterName, the var "$name" can be used in the filterquery.
#json filterquery (search $name, if found navigate it's .Id and .Data else return empty) from $JSONQUERYFILE
#assure quotes are skipped in above result
#transform results into arguments w xargs (delimiter = '\n')
#execute updateJiraQuery.sh w arguments $1 $2 $pass 
