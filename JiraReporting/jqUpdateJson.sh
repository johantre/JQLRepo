#!/bin/sh
DIR=$(dirname $0)
source "$DIR/lib/lib.sh"
prodprops="$DIR/env/prod.update.properties"

JIRAUPDATEQUERY=$(prop 'update.sh' $prodprops)
JQCOMMAND=$(prop 'update.jq.command' $prodprops)
JSONQUERYFILE=$1

printf "For file: $JSONQUERYFILE"
printf "\n"

argsForLoop=(-c -r '.FilterQueries[].Id' "$JSONQUERYFILE")
for i in $($JQCOMMAND "${argsForLoop[@]}") 
  do
      forId=$(echo $i | tr -d '\r')   #remove weird chars from $i...
      argsExecCmd=(-c -r --arg idToSearch "$forId" '.FilterQueries[] | if .Id == $idToSearch then .Id, .Data else empty end' "$JSONQUERYFILE")
      echo "Query updating:" $idToSearch
      $JQCOMMAND "${argsExecCmd[@]}" \
          | sed 's/"/\"/g' \
          | xargs -d '\n' \
          bash $DIR"/"$JIRAUPDATEQUERY
  done
