#!/bin/sh
JSONQUERYFILE="ReportingQueries.json"
UPDATEJIRAQUERY="UpdateJiraQuery.sh"
JQCOMMAND="/C/gitBashCmd/jq-win64.exe"

read -s -p "type in your Q-account pass:" pass 
printf "\n"
printf "\n"
printf "Updating all Queries..."
printf "\n"
printf "\n"

for i in $($JQCOMMAND -c -r '.FilterQueries[].Data.name' $JSONQUERYFILE) 
    do
        forName=$(echo $i | tr -d '\r')   #remove weird chars from $i...      
        echo $forName 
				$JQCOMMAND -c -r --arg nameToSearch "$forName" '.FilterQueries[] | if .Data.name == $nameToSearch then .Id, .Data else empty end' $JSONQUERYFILE \
						| sed 's/"/\"/g' \
						| xargs -d '\n' \
						bash $UPDATEJIRAQUERY $1 $2 $pass
		done




