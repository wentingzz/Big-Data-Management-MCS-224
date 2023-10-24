## Quiz1
- OLTP queries are simpler than OLAP queries.
- Cloud computing benefits include usage elasticity, low initial investment 
- MapReduce can be used to create the text index (e.g. inverted index) of a Web search engine.
- Cloud database systems are always cheaper than on-premise ones.
- The transfer of funds between two bank accounts is an example of an OLTP query.
- Computer instances participating in database clusters don't use shared memory


## Quiz2
- Possible disadvantages of creating an index on a column are: 
  - Extra space
  - Slower insertions 
  -  Slower bulk loads of data 
- Write SQL to return the maximum grade for class 'BANA 295'.
```sql
select MAX(g.grade)
from Grades g
where g.class = 'BANA 295'
```
- Write a SQL query that displays for each Location, the count of students that took class 'BANA 295' and their average grade.
```sql
select s.location, count(*), avg(g.grade)
from students s, grades g
where s.name = g.name AND g.class = 'BANA 295'
group by s.location
```
- Write a query to return the names of students who have taken both 'BANA 295' and 'CS 122A'.
```sql
select s.name
from students s, grades g1, grades g2
where s.name = g1.name AND s.name = g2.name AND g1.class = 'BANA 295' AND g2.class = 'CS 122A'
```
- Write an SQL query that could benefit from a hash index on Location.
```sql
select s.location
from student s
where s.location = 'New York'
```


## Quiz3
Consider table Persons, with person_ID as the primary key. 

| person_ID |   name   |
|-----------|----------|
|   1223    |   Mark   |
|   1567    |  Alison  |
|   1965    |   Sara   |
|   1211    | Jasmine  |
|   1223    |   John   |
- The following instance is not legal because of duplicate primary key.
- (False)All indexes must be created before we insert any records into the tables.
- (False) An index-only execution is only possible using clustered indexes.
- Defining too many transactions in an application can slow down the application.
- Write a SQL query to show the list of names along with the number of time each name appears in the table. That is, the returned table should have columns (name, numStudentsWithThisName). 
```sql
select p.name, COUNT(*) 
from Persons p
group by p.name
```
- Write a query to return the names of students who have taken both 'BANA 295' and 'CS 122A'.
```sql
select s.name
from students s, grades g1, grades g2
where s.name = g1.name AND s.name = g2.name AND g1.class = 'BANA 295' AND g2.class = 'CS 122A'
```
- A hash index on Person_ID would not be useful because it's a range query.
```sql
SELECT * 
FROM Persons
WHERE Person_ID>1500
```

## Quiz4
- Vertical scaling can be achieved by hardware upgrade (e.g. faster CPU).
- Social media data is not as critical as other data so social media platforms do not need to carry the burden of enforcing a strict level of consistency.
- The CAP theorem states that no database system can have ALL of the following properties: consistency, availability and partition tolerance.
- Replication can help to increase the query throughput of a database, that is,  increase the number of answered queries per second.
- The ring topology in Cassandra is used to support both replication and sharding.
- Cassandra is good if you want the fastest possible key-value retrieval.
- MongoDB is the best if you have to store and query a collection of complex (i.e. with nesting) JSONs.

