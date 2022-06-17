# JQLRepo
Repo with all JQL's of MILES4ALL Jira project provided with the scripts to update Jira

# Pre-req's
* install jq by the following command: "sudo apt-get install jq"
Check if the jq command is in your PATH or accessible from cli. 

* Jira access. The scripts provided use your Q-account to update Jira JQL's.
You need a Q-account and permission to update the JQL's in the json file. (see below)

# Usage
* In terminal cli
  - navigate to your git repo, 
  - go to the /JQLRepo/JiraReporting folder. 

* In here, you can start 2 scripts, and you do that with the following commands 
  - bash jqUpdate.sh
This will ask you your Jira pass, and *Name* of the JQL that needs to be updated. The *Name* can be found in the [ReportingQueries.json](./JiraReporting/ReportingQueries.json) file. 
  - bash jqUpdateAll.sh
This will ask you your Jira pass only, as it will update *all* queries found in [ReportingQueries.json](./JiraReporting/ReportingQueries.json) sequencially. 

# Shell script structure
* [UpdateJiraQuery.sh](./JiraReporting/UpdateJiraQuery.sh) does the update in Jira.
* [jqUpdate.sh](./JiraReporting/jqUpdate.sh) calls [UpdateJiraQuery.sh](./JiraReporting/UpdateJiraQuery.sh) using [ReportingQueries.json](./JiraReporting/ReportingQueries.json) as source of the JQL requested.
* [jqUpdateAll.sh](./JiraReporting/jqUpdateAll.sh) calls [UpdateJiraQuery.sh](./JiraReporting/UpdateJiraQuery.sh) using [ReportingQueries.json](./JiraReporting/ReportingQueries.json) as source of *all* the JQL's sequentially.

# Remarks
* jq should be available from cli. Check out [env/prod.update.properties](./JiraReporting/env/prod.update.properties) file. 
A better solution would be having this in your PATH. 
However, maintaining PATH for each employee requires admin rights, which isn't sustainable to maintain. 
* Jira hostname is found in the [env/prod.jira.properties](./JiraReporting/env/prod.jira.properties) file.
