#!/bin/sh
DIR=$(dirname $0)
source "$DIR/lib/lib.sh"
prodprops="$DIR/env/prod.update.properties"

JQUPDATEJSON=$(prop 'update.sh.jq.json' $prodprops)



printf "\n"
printf "Updating all *.json JQueries found in $DIR/payload folder..."

find $DIR -iname "*.json" | while read JSONQUERYFILE
  do
    printf "For file: $JSONQUERYFILE" 
    printf "\n"
    bash $DIR"/"$JQUPDATEJSON "$JSONQUERYFILE"
  done 
