#!/bin/sh
source lib/lib.sh

UPDATEJIRAQUERY=$(prop 'update.sh' 'env/prod.update.properties')
JQUPDATEJSON=$(prop 'update.sh.jq.json' 'env/prod.update.properties')

printf "Updating all Queries found *.json in ./ folder..."
printf "\n"

find . -iname "*.json" | while read JSONQUERYFILE
do
	echo "For file: $JSONQUERYFILE" 
	printf "\n"
	bash $JQUPDATEJSON "$JSONQUERYFILE"

done 
