# JQLRepo
Repo with all JQL's of MILES4ALL Jira project provided with the scripts to update Jira

# Pre-req's
* Windows: Have jq installed.  [stedolan.github.io](https://stedolan.github.io/jq/download/)
  - Put the binary "jq-win64.exe" in your C:\gitBashCmd\ folder
  - Have Git for windows Bash installed if you're not running from Linux through [WUSS BMWGroup](https://wuss.bmwgroup.net/) Search for Git, locate "Git for Windows". 

* Linux: install jq by the following command: "sudo apt-get install jq" (current script goes looking for the /C/gitBashCmd folder for jq)
Script needs improvement to whipe out dependency on the jq folder.

* Jira access. The scripts provided use your Q-account to update Jira JQL's.
You need a Q-account and permission to update the JQL's in the json file. (see below)

# Usage
* Windows: Start your Git for windows Bash, 
  - navigate to your git repo, 
  - go to the /JQLRepo/JiraReporting folder. 

* In here, you can start 2 scripts, and you do that with the following commands 
  - bash jqUpdate.sh
This will ask you your Jira pass, and *Name* of the JQL that needs to be updated. The *Name* can be found in the [ReportingQueries.json](./JiraReporting/ReportingQueries.json) file. 
  - bash jqUpdateAll.sh
This will ask you your Jira pass only, as it will update *all* queries found in ReportingQueries.json sequencially. 

# Shell script structure
* UpdateJiraQuery.sh does the update in Jira.
* jqUpdate.sh calls UpdateJiraQuery.sh using ReportingQueries.json as source of the JQL's
* UpdateJiraQuery.sh calls UpdateJiraQuery.sh using ReportingQueries.json as source of the JQL's

# Remarks
* Location of jq on windows is hard coded. A better solution would be having this in your PATH. 
However, maintaining PATH for each employee requires admin rights, which isn't sustainable to maintain. 
* Jira hostname is hard coded (not likely to change however)
