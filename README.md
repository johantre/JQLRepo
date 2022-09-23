# JQLRepo
Repo with all JQL's provided in the .json payload files.\
The scripts to update Jira using the .json payload files is provided as well.\
\
This project enables anyone to keep track of the Jira queries on their project.\
As queries underpin for instance your Dashboards in Jira, or JQL query results on Confluence pages, they can be nested.
When one of those queries aren't producing the correct result, it can be a pain to figure out what where went wrong.\
Hence the need for version control.

# Pre-req's
* jq command installed.  Check if the jq command is in your PATH or accessible from cli. 
* Jira access. The scripts provided use a technical Q-account to update Jira JQL's.\
You need a technical Q-account and permission to update the JQL's in Jira from the json file. (see below)\
std input isn't required to fetch user:pass, as the script use GitHub secrets to store user:pass. (more details in Remarks at the bottom)\
Currently, GitHub Actions of this GitHub project takes care of the automation towards Jira updating with a **technical user:  QQMIBI4**.\
In order to have this project able to update *your* Jira project, you'll need to  
  - give this **QQMIBI4** user permission to your Jira project
  - write *your own* json payload file (see examples) with *your* queries in it, commit & push to this repo
  - GitHub Actions will update Jira with all JQL's it finds in a changed json files it sees at git push time
  
# Manual Usage
* In terminal cli
  - From anywhere you like, call the scripts below preceding the scripts with the path to their location. 
* In here, you can start 3 scripts, and you do that with the following commands
  - bash [jqUpdate.sh](./JiraReporting/jqUpdate.sh)\
This will ask you a *Name* of the JQL payload that needs to be updated in Jira and the name of the *.json* where to find it. Example of such *Name* can be found in the [ReportingQueries.json](./JiraReporting/ReportingQueries.json) file. 
  - bash [jqUpdateJson.sh](./JiraReporting/jqUpdateJson.sh) *.json*\
This is a version of the script that only requires a *.json* file. This script will update all JQL payloads found in the *.json* file given as the first and only argument. 
  - bash [jqUpdateAll.sh](./JiraReporting/jqUpdateAll.sh)\
This will ask you nothing at all and it will sequencially update *all* JQL payloads queries found of all *.json* files found in [payload](./JiraReporting/payload/) folder. 

# Automation w GitHub Actions
* Whenever a commit on an existing *.json* file or a new one is pushed, the scripts are triggered to take that file, and update Jira with the payloads in that *.json* file.\
  - More specifically, it is the calling [jqUpdateJson.sh](./JiraReporting/jqUpdateJson.sh) and updates Jira with all JQL's in the changed/added *.json* file.
  - This helps understanding that all JQL's in one *.json* file are fitting together and calling each other.\
In practice, they serve to feed our dashboards and progress pages in Jira.
* What's left then for the user of this project?
  - Take your *.json* payload file, do your changes to it
  - Commit your changes to your local repo
  - Push your commit to GitHub
* GitHub Actions will take it from here, and update Jira with your new/changed payload *.json* file.
  - Check out the [https://atc-github.azure.cloud.bmw/ATC-GitHub/github-jira-sync/actions](https://atc-github.azure.cloud.bmw/ATC-GitHub/github-jira-sync/actions) for feedback on your Jira updates. 
* **Caution!** 
  - Test your queries FIRST before committing & pushing!!
  - If you're unsure on your change, do use the Jira INT environment to test out first: [https://atc-int.bmwgroup.net/jira](https://atc-int.bmwgroup.net/jira)
  - This project has been created w/o the knowledge of an existing Jira INT environment, so currently automation towards Jira INT isn't foreseen. Manually the scripts can run from any local machine however. (see Usage section above)\
In the future when the need to automate towards Jira INT this might get implemented.
  - That being said, this GitHub project is under stable condition and serves its purpose well.
Main usage is changing Test Plan issuekeys, which is underpinning our Dashboards.\
New queries are being added as well.  (e.g. our [BoardQueries.json](./JiraReporting/payload/BoardQueries.json) for MPT Board queries.) 

# Shell script structure
* [UpdateJiraQuery.sh](./JiraReporting/UpdateJiraQuery.sh) does the update in Jira.
* [jqUpdate.sh](./JiraReporting/jqUpdate.sh) calls 
  - [UpdateJiraQuery.sh](./JiraReporting/UpdateJiraQuery.sh) using .json file, (e.g. [ReportingQueries.json](./JiraReporting/ReportingQueries.json)) and the name of the JQL as argument to update Jira with the one JQL.
* [jqUpdateJson.sh](./JiraReporting/jqUpdateJson.sh) calls 
  - [UpdateJiraQuery.sh](./JiraReporting/UpdateJiraQuery.sh) using .json files, (e.g. [ReportingQueries.json](./JiraReporting/ReportingQueries.json)) as argument to update Jira with all JQL's in the .json.
* [jqUpdateAll.sh](./JiraReporting/jqUpdateAll.sh) calls 
  - [jqUpdateJson.sh](./JiraReporting/jqUpdateJson.sh) with *all* found .json files as argument, sequentially, to update Jira with all JQL's found in the .json files.

# Payload files
* At the moment of writing, we can say this small project can serve to keep JQL queries under source control.  Whatever the reason it is.
* The current payload files all represent a Jira Dashboard and a series of queries for making test activities transparent. 
  - [BoardQueries.json](./JiraReporting/payload/BoardQueries.json) for MPT Board queries.
  - [ReportingQueries.json](./JiraReporting/payload/ReportingQueries.json) for general queries.
  - [ReportingQueries-WKL-BE.json](./JiraReporting/payload/ReportingQueries-WKL-BE.json) for the weekly releases dashboard BE.
  - [ReportingQueries-WKL-NL.json](./JiraReporting/payload/ReportingQueries-WKL-NL.json) for the weekly releases dashboard NL.
  - [ReportingQueries-FNC-BE.json](./JiraReporting/payload/ReportingQueries-FNC-BE.json) for the functional releases dashboard NL.
  - [ReportingQueries-FNC-NL.json](./JiraReporting/payload/ReportingQueries-FNC-NL.json) for the functional releases dashboard NL.
  - [ReportingQueries-EP-NL.json](./JiraReporting/payload/ReportingQueries-EP-BE.json) for the Emergency Patch releases dashboard NL.
  - [ReportingQueries-EP-NL.json](./JiraReporting/payload/ReportingQueries-EP-NL.json) for the Emergency Patch releases dashboard NL.

# Remarks (Manual & Automation)
* jq should be available from cli. Check out [env/prod.update.properties](./JiraReporting/env/prod.update.properties) file. 
A better solution would be having this in your PATH. 
However, maintaining PATH for each employee requires admin rights, which isn't sustainable to maintain. 
* Jira hostname is found in the [env/prod.jira.properties](./JiraReporting/env/prod.jira.properties) file.
* At the moment of writing, this project works under only ubuntu runners.\
Under the hood, the scripts uses commands like xargs etc, which aren't supported by Powershell.\
Running the scripts from command line however, is possible in windows.\
The windows branch will be kept alive for this purpose: testing locally through WSL/WSL2 or Git Bash.\
The difference in between windows & ubuntu is the jq setup.\
Ubuntu comes with jq pre-installed, windows needs a little help. (More info on the windows branch of this project.) 
* Note that running locally (not in a runner) requires you to have an **env/prod.jira.secret.properties** in order to fetch your credentials.\
Specifically this file is **included in .gitignore**, to prevent committing it to git, as this *must not* be residing in your repo.\
The credentials should be stored in following properties like example below:\
  - **jira.user=Qxxxx**
  - **jira.pass=xyzwhatever**
* Running the scripts from within a runner, requires you to have **GitHub Secrets** set with the self-explanatory content:
  -  **JIRA_USER** 
  -  **JIRA_PASS** 

