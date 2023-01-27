--Quick filters

--In re-test
assignee in (qtd2005, qtd0593, qt76380, qtc6712, qtb4864, qxz084o, qxz0c91, qxz36cw)

--OPS only
(issueFunction in issuesInEpics("project = MILES4ALL AND issuetype = Epic AND (Labels in (Technical_NL, Technical_BE) AND Labels not in (Sofico))") AND (Labels not in (Sofico) OR (Labels is EMPTY))) OR 
(issuetype = Story AND (Labels in (Technical_NL, Technical_BE)) and "Epic Link" is EMPTY)

--MPT only Defect board
(issueFunction in issuesInEpics("project = MILES4ALL AND issuetype = Epic AND (Labels not in (Technical_NL, Technical_BE, Sofico) OR Labels is EMPTY)") AND (Labels not in (Sofico) OR Labels is EMPTY)) OR 
(issuetype = Story AND (Labels not in (Technical_NL, Technical_BE, Sofico) OR Labels is EMPTY) AND "Epic Link" is EMPTY)

--Sofico only
"Feature Team" in (Sofico)

--MPT Sprint board
"Feature Team" not in (Sofico) OR "Feature Team" is EMPTY
