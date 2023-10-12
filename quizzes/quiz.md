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
