#!/bin/sh
DIR=$(dirname $0)
source "$DIR/lib/lib.sh"

prodprops="$DIR/env/prod.update.properties"

UPDATEJIRAQUERY=$(prop 'update.sh' $prodprops)
JQUPDATEJSON=$(prop 'update.sh.jq.json' $prodprops)

printf "Updating all *.json JQueries found in $DIR folder..."
printf "\n"


#find $DIR -iname "*.json" | while read JSONQUERYFILE

find $DIR -iname "*.json" -type f -exec basename {} \; | while read JSONQUERYFILE

do
	echo "For file: $JSONQUERYFILE" 
	printf "\n"
	bash $DIR"/"$JQUPDATEJSON "$JSONQUERYFILE"
done 
