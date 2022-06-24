#!/bin/sh
source lib/lib.sh

UPDATEJIRAQUERY=$(prop 'update.sh' 'env/prod.update.properties')
JQCOMMAND=$(prop 'update.jq.command' 'env/prod.update.properties')

read -s -p "type in your Q-account pass:" pass 
printf "\n"
printf "Updating all Queries..."
printf "\n"

find . -iname "*.json" | while read JSONQUERYFILE
do
	printf "\n"
	echo "For file: $JSONQUERYFILE" 
	argsForLoop=(-c -r '.FilterQueries[].Id' "$JSONQUERYFILE")
	for i in $($JQCOMMAND "${argsForLoop[@]}") 
	    do
	        forId=$(echo $i | tr -d '\r')   #remove weird chars from $i...      
	        argsExecCmd=(-c -r --arg idToSearch "$forId" '.FilterQueries[] | if .Id == $idToSearch then .Id, .Data else empty end' "$JSONQUERYFILE")
					$JQCOMMAND "${argsExecCmd[@]}" \
							| sed 's/"/\"/g' \
							| xargs -d '\n' \
							bash $UPDATEJIRAQUERY $1 $2 $pass
			done
done 
