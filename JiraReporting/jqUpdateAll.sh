#!/bin/sh
source lib.sh

JSONQUERYFILE=$(json)
UPDATEJIRAQUERY=$(prop 'update.sh' 'env/prod.update.properties')
JQCOMMAND=$(prop 'update.jq.command' 'env/prod.update.properties')

read -s -p "type in your Q-account pass:" pass 
printf "\n"
printf "\n"
printf "Updating all Queries..."
printf "\n"
printf "\n"

for i in $($JQCOMMAND -c -r '.FilterQueries[].Id' $JSONQUERYFILE) 
    do
        forId=$(echo $i | tr -d '\r')   #remove weird chars from $i...      
        echo $forName 
				$JQCOMMAND -c -r --arg idToSearch "$forId" '.FilterQueries[] | if .Id == $idToSearch then .Id, .Data else empty end' $JSONQUERYFILE \
						| sed 's/"/\"/g' \
						| xargs -d '\n' \
						bash $UPDATEJIRAQUERY $1 $2 $pass
		done




