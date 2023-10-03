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

