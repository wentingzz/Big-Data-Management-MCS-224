//a
MATCH (p1:Person {name:'James
Marshall'})-[r1:ACTED_IN]->(m:Movie)<-[r2:ACTED_IN]-(p2:Person {name:'Jack
Nicholson'})
RETURN COUNT(*);

//b
MATCH (p:Person)-[r1:ACTED_IN]->(m1:Movie)
MATCH (p)-[r2:DIRECTED]->(m2:Movie)
RETURN DISTINCT(p.name);

//c
MATCH (p:Person)-[:ACTED_IN]->(m:Movie)<-[:DIRECTED]-(p)
MATCH (actor:Person)-[:ACTED_IN]->(m)
RETURN actor.name


//d
MATCH (p:Person)-[:ACTED_IN]->(m1:Movie)
WITH p.name as name, MAX(m1.released) - MIN(m1.released) as yearSpan
WHERE yearSpan >= 20
RETURN name, yearSpan
ORDER BY yearSpan DESC

//e If we can count same collaborator several times
MATCH
(actor:Person)-[:ACTED_IN]->(:Movie)<-[:ACTED_IN]-(collaborator:Person)
WHERE actor.name <> collaborator.name
WITH actor, COUNT(collaborator) AS numCollaborators
RETURN actor.name AS name, numCollaborators
ORDER BY numCollaborators DESC, actor.name
LIMIT 5;

//e If we only count unique collaborators
MATCH
(actor:Person)-[:ACTED_IN]->(:Movie)<-[:ACTED_IN]-(collaborator:Person)
WHERE actor.name <> collaborator.name
WITH actor, COUNT(DISTINCT collaborator) AS numCollaborators
RETURN actor.name AS name, numCollaborators
ORDER BY numCollaborators DESC, actor.name
LIMIT 5;


