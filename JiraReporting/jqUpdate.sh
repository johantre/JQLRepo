#!/bin/sh
DIR=$(dirname $0)
source "$DIR/lib/lib.sh"
prodprops="$DIR/env/prod.update.properties"

JIRAUPDATEQUERY=$(prop 'update.sh' $prodprops)
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
    bash $DIR"/"$JIRAUPDATEQUERY
