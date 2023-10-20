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

--1b
CREATE TABLE trips(trip_id text, call_type text, origin_call int, origin_stand int,
taxi_id int, timestamp text, day_type text, missing_data boolean, PRIMARY
KEY(trip_id));
COPY ks.trips(trip_id, call_type, origin_call, origin_stand, taxi_id, timestamp,
day_type, missing_data) FROM '/tmp/train_8.csv'
WITH DELIMITER=',' AND HEADER=TRUE;

--1c
CREATE INDEX trips_origin_stand_idx ON trips(origin_stand);
SELECT COUNT(*) FROM trips WHERE origin_stand = 15;


