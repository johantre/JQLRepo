#!/bin/sh
source lib/lib.sh

UPDATEJIRAQUERY=$(prop 'update.sh' 'env/prod.update.properties')
JQCOMMAND=$(prop 'update.jq.command' 'env/prod.update.properties')

JSONQUERYFILE=$1

	argsForLoop=(-c -r '.FilterQueries[].Id' "$JSONQUERYFILE")
	for i in $($JQCOMMAND "${argsForLoop[@]}") 
	    do
	        forId=$(echo $i | tr -d '\r')   #remove weird chars from $i...      
	        argsExecCmd=(-c -r --arg idToSearch "$forId" '.FilterQueries[] | if .Id == $idToSearch then .Id, .Data else empty end' "$JSONQUERYFILE")
					$JQCOMMAND "${argsExecCmd[@]}" \
							| sed 's/"/\"/g' \
							| xargs -d '\n' \
							bash $UPDATEJIRAQUERY
			done
