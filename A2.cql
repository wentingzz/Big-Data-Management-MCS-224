-- Installation from guide
CREATE KEYSPACE mykeyspace1 WITH REPLICATION = {'class' : 'SimpleStrategy', 'replication_factor' : 3};
DESCRIBE KEYSPACES
DESCRIBE KEYSPACE mykeyspace1
USE mykeyspace1;
CREATE TABLE emps(sid uuid, name varchar, PRIMARY KEY(sid));
/*uuid is special long int identifier*/
describe tables;
describe sailors;
INSERT INTO emps(sid,name) VALUES (now(), 'John Smith');
SELECT * FROM emps;
CREATE INDEX nameindex ON emps(name);
SELECT * from emps WHERE name='John Smith';


--1a
CREATE KEYSPACE ks WITH REPLICATION = {'class' : 'SimpleStrategy',
'replication_factor' : 3};

