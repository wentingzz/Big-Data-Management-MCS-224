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

## Quiz5
- Index-free adjacency means that to get the neighbors of a node we traverse pointers instead of using an index.
- (False) MySQL uses LSM storage.
- (False) Assume that we insert (key,value): (123,'Bob') to an LSM tree in a system like LevelDB. If we later insert (123,'Alice'), the insertion will be delayed until we find the previous occurrence of key 123 to update it.
- When compacting two SSTables of 1 GB each, the resulting SSTable may be less than 2 GB.
- Bloom filters are useful for membership queries where the exact element is being checked for membership in a set.
- To decrease the false positive probability of a Bloom filter, we must increase its length.

## Quiz6
- Spark is usually faster that MapReduce if the servers of the cluster have large memories.
- (False) MapReduce must be installed on a cluster with shared memory (i.e. servers share the same RAM, instead of each having its own memory)
- All pairs output by mappers that have the same key are input to the same reducer
- MapReduce and Spark are generally used for expensive jobs, that is, we would not use them to find the name of a student with studentid=1234, as they have significant overhead in executing.
- Shuffling is generally the most expensive operation in MapReduce.
- Shuffling in MapReduce is similar to group by in SQL.
- (False) When a server dies during a long MapReduce job, the job starts from the beginning.
- (False) Pig and Hive require to first install Spark.
- A distributed file system logically behaves like a local file system, but physically runs on several servers and stores files on several drives.
- Spark and MapReduce typically read from HDFS (or another distributed file system) so they can read data in parallel from multiple physical drives.

## Quiz7
Suppose the input is a list of rows with format (tweetid, text, userid, retweets). For example:
```
123, "hey UCI", bob1, 12
234, "play UCI", alice2, 0
```
- If you want to count the total number of retweets for each user, the (key,value) pair should be (userid,retweets). 
- If each mapper inputs a group of rows (e.g. 1000), to minimize the shuffling cost in MapReduce, the mapper's output should be after processing all rows emit (userid, sum-of-retweets) pairs 
- It is not a good idea to run MapReduce to answer each Web search query.
- (False) Spark can edit an existing RDD to create a new RDD, so it does not have to create a new RDD from scratch.
- The MapReduce mapper is most similar to Spark's flatMap.
- The reducer in MapReduce is most similar to Spark's reduceByKey.

Spark 
```
errors = lines.filter(lambda s: s.startswith(“ERROR”))
```
- Both errors and lines are RDDs.
- (False) To handle failures, Spark stores all RDDs on HDFS, which replicates file data blocks.

Consider the following code
```
x = sc.parallelize(["spark rdd example", "sample example"])
```
Write pyspark code to count the total number of words in x (the answer should be 5).
```
total_words = x.flatMap(lambda line: line.split(" ")).count()
```

## Quiz8
- SparkSQL can express fewer complex queries than Core Spark.
- To execute an SQL query on a Dataframe, we must first create a View on it.
- (False) A benefit of lazy execution in Spark is that it facilitates replication.
- Consider pyspark program, Spark will execute the filtering condition after line 2
```
rev = messages.filter(lambda s: s.startswith('reverse'));
rev.take(10);
```
- Consider text file:
```commandline
UCI, play, UCI
UCLA, UCI, cook
play, UCLA
```
Write pyspark code to return the words that appear at least 2 times across all lines.
In the above example, the output would be {UCI, play, UCLA}, as they appear 3, 2 and 2 times, respectively.
```
df = sc.textFile(“file.txt”)
flat_df = df.flatMap(lambda x: x.split(' ')
count = flat_df.map(lambda word: (word, 1)).reduceByKey(lambda x, y: x + y)
result = count.filter(lambda x: x[1] > 1)
result.show() 
```
