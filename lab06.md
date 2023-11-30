# Lab 06 - SQL Data Definition

In this lab you will be using the Locations, Departments, Grade, and Employees tables.

Provide the SQL statements that perform the following tasks:

## 1. Create the Locations table with the following attributes:

|   Attribute   |   Data Type   |
| ------------- | ------------- |
| locationID    | INTEGER       |
| address       | VARCHAR(50)   |
| zipCode       | VARCHAR(10)   |
| city          | VARCHAR(20)   |
| state         | VARCHAR(20)   |
| country       | VARCHAR(20)   |

```sql
CREATE TABLE Locations (
locationID INTEGER,
address VARCHAR(50),
zipCode VARCHAR(10),
city VARCHAR(20),
state VARCHAR(20),
country VARCHAR(20)
);
```

## 2. Create the Departments table with the following attributes:

| Attribute  | Data Type   |
| ---------- | ----------- |
| deptID     | INTEGER     |
| deptNAME   | VARCHAR(20) |
| managerID  | INTEGER     |
| locationID | INTEGER     |

```sql
CREATE TABLE Departments (
deptID INTEGER,
deptNAME VARCHAR(20),
managerID INTEGER,
locationID INTEGER
);
```

## 3. Create the Grades table with the following attributes:

| Attribute     | Data Type  |
| ------------- | ---------- |
| gradeLevel    | VARCHAR(1) |
| lowestSalary  | DECIMAL    |
| highestSalary | DECIMAL    |

```sql
CREATE TABLE Grades (
gradeLevel VARCHAR(1),
lowestSalary DECIMAL,
highestSalary DECIMAL
);
```

## 4. Create the Employees table with the following attributes:

| Attribute     | Data Type   |
| ------------- | ----------- |
| employeeID    | INTEGER     |
| fName         | VARCHAR(20) |
| lName         | VARCHAR(20) |
| email         | VARCHAR(20) |
| phone         | VARCHAR(20) |
| hireDate      | VARCHAR(20) |
| jobID         | VARCHAR(20) |
| salary        | DECIMAL     |
| commissionPCT | DECIMAL     |
| managerID     | INTEGER     |
| deptID        | INTEGER     |

```sql
CREATE TABLE Employees (
employeeID INTEGER,
fName VARCHAR(20),
lName VARCHAR(20),
email VARCHAR(20),
phone VARCHAR(20),
hireDate VARCHAR(20),
jobID VARCHAR(20),
salary DECIMAL,
commissionPCT DECIMAL,
managerID INTEGER,
deptID INTEGER
);
```

---

## Preliminary Tasks

Execute the following SQL statements to insert sample data into the tables Departments, Locations, Employees, and Grades:

```sql
INSERT INTO Locations VALUES('1400','2014 Jabberwocky Rd','26192','Southlake','Texas','United States');
INSERT INTO Locations VALUES('1500','2011 Interiors Blvd','99236','South San Francisco','California','United States');
INSERT INTO Locations VALUES('1600','2007 Zagora St','50090','South Brunswick','New Jersey','United States');
INSERT INTO Locations VALUES('1700','2004 Charade Rd','98199','Seattle','Washington','United States');
INSERT INTO Locations VALUES('1800','147 Spadina Ave','M5V 2L7','Toronto','Ontario','Canada');
INSERT INTO Locations VALUES('1900','6092 Boxwood St','YSW 9T2','Whitehorse','Yukon','Canada');
INSERT INTO Locations VALUES('2500','Magdalen Centre, The Oxford Science Park','OX9 9ZB','Oxford','Oxford','United Kingdom');
INSERT INTO Locations VALUES('2600','9702 Chester Road','9629850293','Stretford','Manchester','United Kingdom');
INSERT INTO Locations VALUES('2700','Schwanthalerstr. 7031','80925','Munich','Bavaria','Germany');


INSERT INTO Departments VALUES(10,'Administration',200,1700);
INSERT INTO Departments VALUES (20,'Marketing',201,1800);
INSERT INTO Departments VALUES (30,'Purchasing',114,1700);
INSERT INTO Departments VALUES (40,'Human Resources',203,2600);
INSERT INTO Departments VALUES (50,'Shipping',121,1500);
INSERT INTO Departments VALUES (60,'IT',103,1400);
INSERT INTO Departments VALUES (70,'Public Relations',204,2700);
INSERT INTO Departments VALUES (80,'Sales',145,2500);
INSERT INTO Departments VALUES (90,'Executive',100,1700);
INSERT INTO Departments VALUES (100,'Finance',108,1700);
INSERT INTO Departments VALUES (110,'Accounting',199,1700);


INSERT INTO Grades VALUES('A','1000','2999');
INSERT INTO Grades VALUES('B','3000','5999');
INSERT INTO Grades VALUES('C','6000','9999');
INSERT INTO Grades VALUES('D','10000','14999');
INSERT INTO Grades VALUES('E','15000','24999');
INSERT INTO Grades VALUES('F','25000','40000');


INSERT INTO Employees VALUES('100','Steven','King','SKING','515.123.4567','2003-06-17','AD_PRES','24000.00','0.00','0','90');
INSERT INTO Employees VALUES('101','Neena','Kochhar','NKOCHHAR','515.123.4568','2005-09-21','AD_VP','17000.00','0.00','100','90');
INSERT INTO Employees VALUES('102','Lex','DeHaan','LDEHAAN','515.123.4569','2001-01-13','AD_VP','17000.00','0.00','100','90');
INSERT INTO Employees VALUES('103','Alexander','Hunold','AHUNOLD','590.423.4567','2006-01-03','IT_PROG','9000.00','0.00','102','60');
INSERT INTO Employees VALUES('104','Bruce','Ernst','BERNST','590.423.4568','2007-05-21','IT_PROG','6000.00','0.00','103','60');
INSERT INTO Employees VALUES('108','Nancy','Greenberg','NGREENBE','515.124.4569','2002-08-17','FI_MGR','12000.00','0.00','101','100');
INSERT INTO Employees VALUES('109','Daniel','Faviet','DFAVIET','515.124.4169','2002-08-16','FI_ACCOUNT','9000.00','0.00','108','100');
INSERT INTO Employees VALUES('110','John','Chen','JCHEN','515.124.4269','2005-09-28','FI_ACCOUNT','8200.00','0.00','108','100');
INSERT INTO Employees VALUES('111','Ismael','Sciarra','ISCIARRA','515.124.4369','2005-09-30','FI_ACCOUNT','7700.00','0.00','108','100');
INSERT INTO Employees VALUES('114','Den','Raphaely','DRAPHEAL','515.127.4561','2002-12-07','PU_MAN','11000.00','0.00','100','30');
INSERT INTO Employees VALUES('115','Alexander','Khoo','AKHOO','515.127.4562','2003-05-18','PU_CLERK','3100.00','0.00','114','30');
INSERT INTO Employees VALUES('120','Matthew','Weiss','MWEISS','650.123.1234','2004-07-18','ST_MAN','8000.00','0.00','100','50');
INSERT INTO Employees VALUES('121','Adam','Fripp','AFRIPP','650.123.2234','2005-04-10','ST_MAN','8200.00','0.00','100','50');
INSERT INTO Employees VALUES('145','John','Russell','JRUSSEL','011.44.1344.429268','2004-10-01','SA_MAN','14000.00','0.40','100','80');
INSERT INTO Employees VALUES('146','Karen','Partners','KPARTNER','011.44.1344.467268','2005-01-05','SA_MAN','13500.00','0.30','100','80');
INSERT INTO Employees VALUES('180','Winston','Taylor','WTAYLOR','650.507.9876','2006-01-24','SH_CLERK','3200.00','0.00','120','50');
INSERT INTO Employees VALUES('198','Donald','OConnell','DOCONNEL','650.507.9833','2007-06-21','AC_ACCOUNT','2600.00','0.00','199','110');
INSERT INTO Employees VALUES('199','Shelley','Higgins','SHIGGINS','515.123.8080','2002-06-07','AC_MGR','12008.00','0.00','101','110');
```


Execute the following SQL statement that creates the view Employees_VW.

```sql
CREATE VIEW Employees_VW AS
SELECT * FROM Employees;
```

Check the content of the view Employees_VW.

```sql
SELECT * FROM Employees_VW;
```

---


## 5. Create the view Employees100_VW that lists the employee ID, the first name, the last name, the phone, the salary, the job ID, and the department ID of employees working in the department with deptID = 100.

```sql
CREATE VIEW Employees100_VW AS
SELECT employeeID, fName, lName, phone, salary, jobID, deptID
FROM Employees
WHERE deptID = 100;
```

```sql
SELECT * FROM Employees100_VW;
```

employeeID|fName|lName|phone|salary|jobID|deptID
---|---|---|---|---|---|---
108|Nancy|Greenberg|515.124.4569|12000|FI_MGR|100
109|Daniel|Faviet|515.124.4169|9000|FI_ACCOUNT|100
110|John|Chen|515.124.4269|8200|FI_ACCOUNT|100
111|Ismael|Sciarra|515.124.4369|7700|FI_ACCOUNT|100

## 6. Use the view you created in the previous task (i.e., Employees100_VW) to create the view Employees100b_VW that lists the first name, the last name, and the salary of employees working in the department with deptID = 100.

```sql
CREATE VIEW Employees100b_VW AS
SELECT fName, lName, salary
FROM Employees100_VW
WHERE deptID = 100;
```

## 7. Create the view EmployeesDept_VW that lists the employee ID, the first name, the last name, the hire date, and the department name of all employees. Note: You need to join two tables to accomplish this task.

```sql
CREATE VIEW EmployeesDept_VW AS
SELECT e.employeeID, e.fName, e.lName, e.hireDate, d.deptNAME
FROM Employees e
INNER JOIN Departments d
ON e.deptID = d.deptID;
```

## 8. Create the view EmployeesLowPaid_VW that lists the employee ID, the first name, the last name, the salary, and the department name of employees with a salary lower than the average salary of all employees.

```sql
CREATE VIEW EmployeesLowPaid_VW AS
SELECT e.employeeID, e.fName, e.lName, e.salary, d.deptNAME
FROM Employees e
INNER JOIN Departments d
ON e.deptID = d.deptID
WHERE e.salary < (SELECT AVG(salary) FROM Employees);
```

## 9. Create the view EmployeesLocations_VW that lists the first name, the last name, the department name, the city, the state, and the country for all employees, sorted by last name. Note: You need to join three tables to accomplish this task.

```sql
CREATE VIEW EmployeesLocations_VW AS
SELECT e.fName, e.lName, d.deptNAME, l.city, l.state, l.country
FROM Employees e
INNER JOIN Departments d
ON e.deptID = d.deptID
INNER JOIN Locations l
ON d.locationID = l.locationID
ORDER BY e.lName;
```

## 10. Create the view EmployeesByDept_VW that lists, for each department name, the number of employees, and the total of their salaries. Names of view columns should be deptName, eCount, and salaries, respectively.

```sql
CREATE VIEW EmployeesByDept_VW AS
SELECT d.deptNAME AS deptName, COUNT(e.employeeID) AS eCount, SUM(e.salary) AS salaries
FROM Employees e
INNER JOIN Departments d
ON e.deptID = d.deptID
GROUP BY d.deptNAME;
```

```sql
SELECT * FROM EmployeesByDept_VW;
```

deptName|eCount|salaries
---|---|---|---
Accounting|2|14608
Executive|3|58000
Finance|4|36900
IT|2|15000
Purchasing|2|14100
Sales|2|27500
Shipping|3|19400

## 11. (Optional) Create the view EmployeesManagers_VW that lists the first name and the last name of all employees, along with the last name of their managers. Names of view columns should be fName, lName, and managerName, respectively.

Notes: 
- This information can be retrieved from the Employees table only.
- Each employee record has a managerID value which represents the employeeID of his/her manager. 
- To accomplish this task, you need to join the Employees table with itself; use the alias e for the Employees table where you retrieve the employees, and use the alias m for the Employees table where you retrieve the managers.  

```sql
CREATE VIEW EmployeesManagers_VW AS
SELECT e.fName, e.lName, m.lName AS managerName
FROM Employees e
INNER JOIN Employees m
ON e.managerID = m.employeeID;
```

```sql
SELECT * FROM EmployeesManagers_VW;
```

fName|lName|managerName
---|---|---|---
Neena|Kochhar|King
Lex|DeHaan|King
Alexander|Hunold|DeHaan
Bruce|Ernst|Hunold
Nancy|Greenberg|Kochhar
Daniel|Faviet|Greenberg
John|Chen|Greenberg
Ismael|Sciarra|Greenberg
Den|Raphaely|King
Alexander|Khoo|Raphaely
Matthew|Weiss|King
Adam|Fripp|King
John|Russell|King
Karen|Partners|King
Winston|Taylor|Weiss
Donald|OConnell|Higgins
Shelley|Higgins|Kochhar

## 12. (Optional) Create the view EmployeesSalaryGrades_VW that lists the first name, the last name, the salary, and the grade level for all employees.
Notes: 
- Grade levels exist in the Grades table.
- In this task the condition that joins the tables should include inequalities or a range search condition (i.e., BETWEEN … AND).

```sql
CREATE VIEW EmployeesSalaryGrades_VW AS
SELECT e.fName, e.lName, e.salary, g.gradeLevel
FROM Employees e
INNER JOIN Grades g
ON e.salary BETWEEN g.lowestSalary AND g.highestSalary;
```

```sql
SELECT * FROM EmployeesSalaryGrades_VW;
```

fName|lName|salary|gradeLevel
---|---|---|---
Steven|King|24000|E
Neena|Kochhar|17000|E
Lex|DeHaan|17000|E
Alexander|Hunold|9000|C
Bruce|Ernst|6000|C
Nancy|Greenberg|12000|D
Daniel|Faviet|9000|C
John|Chen|8200|C
Ismael|Sciarra|7700|C
Den|Raphaely|11000|D
Alexander|Khoo|3100|B
Matthew|Weiss|8000|C
Adam|Fripp|8200|C
John|Russell|14000|D
Karen|Partners|13500|D
Winston|Taylor|3200|B
Donald|OConnell|2600|A
Shelley|Higgins|12008|D
