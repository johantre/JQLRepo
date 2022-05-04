
--Miles board query before 15/09
project = MILES4ALL AND 
issuetype != Test AND 
issuetype != Pre-Condition AND 
issuetype != "Test Set" AND 
issuetype != "Test Execution" AND 
issuetype != "Test Plan" AND 
("Project Specific Labels" is EMPTY OR "Project Specific Labels" != Analysis) AND 
("Project Specific Labels" is EMPTY OR "Project Specific Labels" != Sofico) AND 
(Labels is EMPTY OR Labels != UnderRefinement) AND 
status != Closed 
ORDER BY Rank ASC

--Miles board query latest & greatest
project = MILES4ALL AND 
issuetype not in (Test, Pre-Condition, "Test Set", "Test Execution", "Test Plan") AND
status != Closed 
ORDER BY Rank ASC

--Miles Defect Kanban board "Business View"
project in (MILES4ALL, "MyBMW@SF") AND 
		((issuetype in (Defect) AND 
				status not in (Inactive, Ready)) OR 
		 (issuetype = Epic AND 
		 		status != Closed) OR 
		 (issuetype = Story AND 
		 		status not in (Closed, Resolved) AND 
		 		"Epic Link" is not EMPTY AND 
		 		issuetype not in (Saga))
		) ORDER BY Rank ASC

--Quick filters

--OPS only
(issueFunction in issuesInEpics("project = MILES4ALL AND issuetype = Epic AND (Labels in (Technical_NL, Technical_BE) AND Labels not in (Sofico))") AND (Labels not in (Sofico) OR (Labels is EMPTY))) OR 
(issuetype = Story AND (Labels in (Technical_NL, Technical_BE)) and "Epic Link" is EMPTY)

--MPT only
(issueFunction in issuesInEpics("project = MILES4ALL AND issuetype = Epic AND (Labels not in (Technical_NL, Technical_BE, Sofico) OR Labels is EMPTY)") AND (Labels not in (Sofico) OR Labels is EMPTY)) OR 
(issuetype = Story AND (Labels not in (Technical_NL, Technical_BE, Sofico) OR Labels is EMPTY) AND "Epic Link" is EMPTY)

--Sofico only
"Project Specific Labels" in (Sofico) OR labels in (Sofico)

--Non Sofico 
Labels not in (Sofico) OR Labels is EMPTY 
