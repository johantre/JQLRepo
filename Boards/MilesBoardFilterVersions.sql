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
