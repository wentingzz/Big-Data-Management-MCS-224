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

