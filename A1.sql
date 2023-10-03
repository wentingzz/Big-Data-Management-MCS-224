-- Run before assignment 1
CREATE TABLE Employee (id int, name varchar(255), email varchar(255),
salary int, managerId int, experience_years int);
# note that managerid is the id of a record (a manager) in the Employee
table
INSERT INTO Employee (id, name, email, salary, managerId,
experience_years) values (1, 'Tom', 'a@b.com', 70000, 3, 3);
INSERT INTO Employee (id, name, email, salary, managerId,
experience_years) values (2, 'John', 'c@d.com', 80000, 4, 2);
INSERT INTO Employee (id, name,email, salary, managerId,
experience_years) values (3, 'Katrina', 'a@b.com', 98000, NULL, 1);
INSERT INTO Employee (id, name,email, salary, managerId,
experience_years) values (4, 'Namy', 't@b.com', 90000, NULL, 2);
INSERT INTO Employee (id, name, email, salary, managerId,
experience_years) values (5, 'Jim', 'j@d.com', 100000, 4, 15);
CREATE TABLE Project (project_id int, employee_id int);
INSERT INTO Project (project_id, employee_id) values (1, 1);
INSERT INTO Project (project_id, employee_id) values (1, 2);
INSERT INTO Project (project_id, employee_id) values (1, 3);
INSERT INTO Project (project_id, employee_id) values (2, 1);
INSERT INTO Project (project_id, employee_id) values (2, 4);
CREATE TABLE departments( department_id int NOT NULL, department_name
char(50) NOT NULL, CONSTRAINT PRIMARY KEY (department_id));
INSERT INTO departments(department_id,department_name) VALUES(10,
'sales');
INSERT INTO departments(department_id,department_name) VALUES(20,
'marketing');

INSERT INTO departments(department_id,department_name) VALUES(30,
'accounting');
CREATE TABLE DepartmentProjects (department_id, project_id);
INSERT INTO DepartmentProjects (department_id, project_id) VALUES (10,
1);
INSERT INTO DepartmentProjects (department_id, project_id) VALUES (20,
2);


--1
CREATE TABLE Employee (
	id int PRIMARY KEY,
	name varchar(255),
	email varchar(255),
	salary int,
	managerId int,
	experience_years int
);
CREATE TABLE Project (
	project_id int,
	employee_id int REFERENCES Employee(id),
	PRIMARY KEY (project_id, employee_id)
);
CREATE TABLE DepartmentProjects (
	department_id int REFERENCES departments(department_id),
	project_id int,
	PRIMARY KEY (department_id, project_id)
);

--2
SELECT e.name
FROM Employee e
WHERE e.salary > (SELECT AVG(e2.salary) FROM Employee e2);

--3
SELECT MAX(e.salary)
FROM Employee e
WHERE e.salary < (SELECT MAX(e2.salary) FROM Employee e2);

--4
CREATE INDEX idx_salary ON Employee using Btree (salary);

--5
SELECT e.email
FROM Employee e
GROUP BY e.email
HAVING COUNT(email) > 1;

--6
SELECT e.*
FROM Employee e, Employee mng
WHERE e.managerId = mng.id AND e.salary > mng.salary;

--7
SELECT p.project_id, AVG(e.experience_years)
FROM Employee e, Project p
WHERE e.id = p.employee_id
GROUP BY p.project_id;

--8
SELECT e.id, e.name, mng.name, COUNT(p.project_id)
FROM Employee e
LEFT JOIN Project p ON e.id = p.employee_id
INNER JOIN Employee mng ON e.managerId = mng.id
GROUP BY e.id, mng.name;
