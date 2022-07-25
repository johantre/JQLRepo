# JQLRepo
Repo with all JQL's provided in the .json payload files. 
The scripts to update Jira using the .json payload files is provided as well. 

# Pre-req's
* jq command installed.  Check if the jq command is in your PATH or accessible from cli. 
* Jira access. The scripts provided use a technical Q-account to update Jira JQL's.
You need a technical Q-account and permission to update the JQL's in the json file. (see below)
std input isn't required to fetch user:pass, as the script use a base64 encoded account for Jira access. 

# Usage
* In terminal cli 
  - From anywhere you like, call the scripts below preceding the scripts with the path to their location. 
* In here, you can start 3 scripts, and you do that with the following commands 
  - bash jqUpdate.sh
This will ask you a *Name* of the JQL payload that needs to be updated in Jira and the name of the *.json* where to find it. Example of such *Name* can be found in the [ReportingQueries.json](./JiraReporting/ReportingQueries.json) file. 
  - bash jqUpdateJson.sh *.json*
This is a version of the script that only requires a *.json* file. This script will update all JQL payloads found in the *.json* file given as the first and only argument. 
  - bash jqUpdateAll.sh
This will ask you nothing at all and it will update *all* JQL payloads queries found in [ReportingQueries.json](./JiraReporting/ReportingQueries.json) sequencially. 

# Shell script structure
* [UpdateJiraQuery.sh](./JiraReporting/UpdateJiraQuery.sh) does the update in Jira.
* [jqUpdate.sh](./JiraReporting/jqUpdate.sh) calls [UpdateJiraQuery.sh](./JiraReporting/UpdateJiraQuery.sh) using .json files, e.g. [ReportingQueries.json](./JiraReporting/ReportingQueries.json) as source of the JQL requested.
* [jqUpdateJson.sh](./JiraReporting/jqUpdateJson.sh) calls [UpdateJiraQuery.sh](./JiraReporting/UpdateJiraQuery.sh) using .json files, e.g. [ReportingQueries.json](./JiraReporting/ReportingQueries.json) as source of the JQL requested.
* [jqUpdateAll.sh](./JiraReporting/jqUpdateAll.sh) calls 
  - [jqUpdateJson.sh](./JiraReporting/jqUpdateJson.sh) with *all* found .json files as argument, sequentially.
  - [UpdateJiraQuery.sh](./JiraReporting/UpdateJiraQuery.sh) to do the Jira update.

# Payload files
* The initial intend of this project is to have all queries that are holding together and feeding a Jira Dashboard under source control.
All queries are found in those payload files contain the json payloads to update Jira.
At the moment of writing, we can say this small project can serve to keep JQL queries under source control.  Whatever the reason it is. 
* The current payload files all represent a Jira Dashboard for testing purposes. 
  - [ReportingQueries.json](./JiraReporting/payload/ReportingQueries.json) for general queries.
  - [ReportingQueries-WKL-BE.json](./JiraReporting/payload/ReportingQueries-WKL-BE.json) for the weekly releases dashboard BE.
  - [ReportingQueries-WKL-NL.json](./JiraReporting/payload/ReportingQueries-WKL-NL.json) for the weekly releases dashboard NL.
  - [ReportingQueries-FNC-BE.json](./JiraReporting/payload/ReportingQueries-FNC-BE.json) for the functional releases dashboard NL.
  - [ReportingQueries-FNC-NL.json](./JiraReporting/payload/ReportingQueries-FNC-NL.json) for the functional releases dashboard NL.
  - [ReportingQueries-EP-NL.json](./JiraReporting/payload/ReportingQueries-EP-BE.json) for the Emergency Patch releases dashboard NL.
  - [ReportingQueries-EP-NL.json](./JiraReporting/payload/ReportingQueries-EP-NL.json) for the Emergency Patch releases dashboard NL.

# Remarks
* jq should be available from cli. Check out [env/prod.update.properties](./JiraReporting/env/prod.update.properties) file. 
A better solution would be having this in your PATH. 
However, maintaining PATH for each employee requires admin rights, which isn't sustainable to maintain. 
* Jira hostname is found in the [env/prod.jira.properties](./JiraReporting/env/prod.jira.properties) file.
