# Lab 03 - SQL Data Manipulation

## Preliminary Tasks

Execute the following SQL statements to create the tables Branch and Staff, then insert sample data into both tables. The structures of the created tables are as follows.

- Branch (branchNo, address, city, state, phone)
- Staff  (stafftNo, fName, lName, position, sex, age, salary, phone, address, city, state, branchNo)

```sql
CREATE TABLE Branch (
branchNo VARCHAR(4),
address VARCHAR(50),
city VARCHAR(30),
state VARCHAR(2),
phone VARCHAR(20),
PRIMARY KEY (branchNo));

INSERT INTO Branch VALUES('B001','366 Tiger Ln','Los Angeles','CA','213-539-8600');
INSERT INTO Branch VALUES('B002','18 Harrison Rd','New Haven','CT','203-444-1818');
INSERT INTO Branch VALUES('B003','55 Waydell St','Essex','NJ','201-700-7007');
INSERT INTO Branch VALUES('B004','22 Canal St','New York','NY','212-055-9000');
INSERT INTO Branch VALUES('B005','1725 Roosevelt Ave','Queens','NY','718-963-8100');
INSERT INTO Branch VALUES('B006','1471 Jerrold Ave','Philadelphia','PA','267-222-5252');


CREATE TABLE Staff (
staffNo VARCHAR(4),
fName VARCHAR(20),
lName VARCHAR(20),
position VARCHAR(20),
sex VARCHAR(1),
age INTEGER,
salary DECIMAL(8,2),
phone VARCHAR(20),
address VARCHAR(50),
city VARCHAR(20),
state VARCHAR(2),
branchNo VARCHAR(4),
PRIMARY KEY (staffNo));


INSERT INTO Staff VALUES('S001','Krista','Allen','Manager','F','33','48000','917-874-1229','4 Kohler Memorial Dr','Brooklyn','NY','B004');
INSERT INTO Staff VALUES('S002','Charlie','Arnold','Assistant','M','32','36000','347-925-5213','2371 Jerrold Ave','Queens ','NY','B003');
INSERT INTO Staff VALUES('S003','Jonathon','Bowman','Assistant','M','41','36000','213-775-4480','10759 Main St','Scottsdale','AZ','B001');
INSERT INTO Staff VALUES('S004','Joe','Bryan','Manager','M','34','48000','720-870-5536','42754 S Ash Ave','New Haven','NY','B002');
INSERT INTO Staff VALUES('S005','Danny','Chavez','Supervisor','M','41','48000','720-828-7047','46314 Route 130','Fairfield','CT','B002');
INSERT INTO Staff VALUES('S006','Renee','Figueroa','Assistant','F','21','24000','213-420-8970','96541 W Central Blvd','Phoenix','AZ','B001');
INSERT INTO Staff VALUES('S007','Patty','Frazier','Supervisor','F','41','51600','213-639-9887','2409 Alabama Rd','Riverside','CA','B001');
INSERT INTO Staff VALUES('S008','Emmett','Garza','Assistant','M','30','36000','917-877-8409','6 Gilson St','Bronx','NY','B004');
INSERT INTO Staff VALUES('S009','Lana','Hodges','Supervisor','F','35','36000','646-645-3605','18 3rd Ave','New York','NY','B004');
INSERT INTO Staff VALUES('S010','Jesus','Mann','Manager','M','47','60000','201-587-5746','25346 New Rd','Staten Island','NY','B003');
INSERT INTO Staff VALUES('S011','Lorena','Marsh','Manager','F','36','48000','720-634-7158','426 Wolf St','New Haven','CT','B002');
INSERT INTO Staff VALUES('S012','Erik','Olson','Assistant','M','22','24000','720-579-2907','8 S Haven St','New Haven','CT','B002');
INSERT INTO Staff VALUES('S013','Leslie','Pearson','Manager','F','52','60000','646-752-4114','30553 Washington Rd','Plainfield','NJ','B004');
INSERT INTO Staff VALUES('S014','Diane','Rogers','Assistant','F','27','36000','347-504-3552','82 Us Highway 46','Clifton','NJ','B004');
INSERT INTO Staff VALUES('S015','Nina','Scott','Assistant','F','29','36000','201-636-4117','33 Lewis Rd #46','Jersey City','NJ','B003');
INSERT INTO Staff VALUES('S016','Owen','Singleton','Manager','M','31','48000','310-928-5182','4119 Metropolitan Dr','Los Angeles','CA','B001');
INSERT INTO Staff VALUES('S017','Janice','Underwood','Assistant','F','20','24000','720-822-7652','38 Pleasant Hill Rd','New Haven','CT','B002');
INSERT INTO Staff VALUES('S018','Edward','Warner','Assistant','M','23','24000','551-300-1771','993 Washington Ave','Essex','NJ','B003');
INSERT INTO Staff VALUES('S019','Amos','Wilkerson','Assistant','M','20','24000','310-898-2154','34 Raritan Center Pky','Los Angeles','CA','B001');
INSERT INTO Staff VALUES('S020','Kelley','Wood','Assistant','F','22','24000','551-390-2251','13 S Hacienda Dr','Essex','NJ','B003');
INSERT INTO Staff VALUES('S021','Brad','Herman','Manager','M','39','48000','917-577-5488','16 E 108th St','New York','NY','B004');
INSERT INTO Staff VALUES('S022','Alisa','Garcia','Assistant','F','20','24000','646-411-4775','22 Sip Ave','Jersey City','NJ','B004');
INSERT INTO Staff VALUES('S023','Igor','Strovinsky','Assistant','M','24','24000','347-103-4123','1266 Flatbush Ave','Brooklyn','NY','B004');
```


## Lab Tasks

### 1. Display the lowest and the highest salaries of all staff members. Rename the outputs with minSalary and maxSalary, respectively.

```sql
SELECT MIN(salary) as minSalary, MAX(salary) as maxSalary FROM Staff;
```

minSalary | maxSalary
----------|----------
24000|60000

### 2. Display the number of managers in each branch. Rename the numbers of managers with managerCount.

```sql
SELECT branchNo, COUNT(*) as managerCount FROM Staff WHERE position = 'Manager' GROUP BY branchNo;
```

branchNo | managerCount
---------|-------------
B001|1
B002|2
B003|1
B004|3

### 3. In each state, display the number of staff members (as staffCount) and the average of their salaries (as avgSalary).

```sql
SELECT state, COUNT(*) as staffCount, AVG(salary) as avgSalary FROM Staff GROUP BY state;
```

state | staffCount | avgSalary
------|------------|----------
AZ|2|30000.0
CA|3|41200.0
CT|4|36000.0
NJ|6|34000.0
NY|8|42000.0

### 4. Using a subquery, list the first name, the last name, the position, the sex, the age, and the salary of the staff members who work in the branch located at '366 Tiger Ln'.

```sql
SELECT fName, lName, position, sex, age, salary FROM Staff WHERE branchNo =
(SELECT branchNo FROM Branch WHERE address = '366 Tiger Ln');
```

fName | lName | position | sex | age | salary
------|-------|----------|-----|-----|-------
Jonathon|Bowman|Assistant|M|41|36000
Renee|Figueroa|Assistant|F|21|24000
Patty|Frazier|Supervisor|F|41|51600
Owen|Singleton|Manager|M|31|48000
Amos|Wilkerson|Assistant|M|20|24000

### 5. List the first name, the last name, the position, the sex, the age, and the salary of the managers of the branch located at '22 Canal St'.

```sql
SELECT fName, lName, position, sex, age, salary FROM staff WHERE position = 'Manager'
AND branchNo = (SELECT branchNo FROM Branch WHERE address = '22 Canal St');
```

### 6. Display the count (as staffCount) and the average salary (as avgSalary) of female managers working in the branch located at '22 Canal St'.

```sql
SELECT COUNT(*) as staffCount, AVG(salary) as avgSalary
FROM Staff
WHERE sex = 'F'   
AND position = 'Manager'
AND branchNo = (SELECT branchNo FROM Branch WHERE address = '22 Canal St');
```

### 7. List the first name, the last name, the position, the sex, the age, and the salary of staff with salaries greater than the average salary of all staff members.

```sql
SELECT fName, lName, position, sex, age, salary
FROM Staff
WHERE salary > (SELECT AVG(salary) FROM Staff);
```

### 8. List the first name, the last name, the position, the sex, the age, and the salary of staff with salaries greater than the average salary of all female managers.

```sql
SELECT fName, lName, position, sex, age, salary
FROM Staff
WHERE salary >
(SELECT AVG(salary) FROM Staff WHERE sex = 'F' AND position = 'Manager');
```

### 9. List the first name, the last name, the position, the sex, the age, and the salary of the youngest staff members. Hint: Use a subquery that returns the smallest age.

```sql
SELECT fName, lName, position, sex, age, salary
FROM Staff
WHERE age = (SELECT MIN(age) FROM Staff);
```

### 10. List the first name, the last name, the position, the sex, the age, and the salary of the oldest supervisors.

```sql
SELECT fName, lName, position, sex, age, salary
FROM Staff
WHERE position = 'Supervisor'
AND age = (SELECT MAX(age) FROM Staff WHERE position = 'Supervisor');
```

### 11. List the first name, the last name, the position, the sex, the age, and the salary of the managers with the lowest salary. Hint: Use a subquery that returns the lowest salary of managers.

```sql
SELECT fName, lName, position, sex, age, salary
FROM Staff
WHERE position = 'Manager'
AND salary = (SELECT MIN(salary) FROM Staff WHERE position = 'Manager');
```


### 12. List the first name, the last name, the position, the sex, the age, and the salary of the assistants with the highest salary.

```sql
SELECT fName, lName, position, sex, age, salary
FROM Staff
WHERE position = 'Assistant'
AND salary = (SELECT MAX(salary) FROM Staff WHERE position = 'Assistant');
```

### 13. List the first name, the last name, the position, the sex, the age, and the salary of the staff members with the second lowest salary.

```sql
SELECT fName, lName, position, sex, age, salary
FROM Staff
WHERE salary = (SELECT MIN(salary) FROM Staff WHERE salary > (SELECT MIN(salary) FROM Staff));
```

or:

```sql
SELECT fName, lName, position, sex, age, salary
FROM Staff
WHERE salary = (SELECT MIN(salary) FROM Staff WHERE salary NOT IN (SELECT MIN(salary) FROM Staff));
```

### 14. List the first name, the last name, the position, the salary, and the branch address of all staff sorted in the ascending order of the branch address. Note: Since the address attribute exists in both tables, you will need to use a table alias as a prefix to specify the address that should be returned.

```sql
SELECT s.fName, s.lName, s.position, s.salary, b.address
FROM Staff s, Branch b
WHERE s.branchNo = b.branchNo
ORDER BY b.address ASC;
```

### 15. List the first name, the last name, the position, the salary, and the branch address of all managers sorted in the descending order of the salary.

```sql
SELECT s.fName, s.lName, s.position, s.salary, b.address
FROM Staff s, Branch b
WHERE s.branchNo = b.branchNo
AND s.position = 'Manager'
ORDER BY s.salary DESC;
```

### 16. List the first name, the last name, the position, the sex, the age, the salary, and the branch phone number of all male managers.

```sql
SELECT s.fName, s.lName, s.position, s.sex, s.age, s.salary, b.phone
FROM Staff s, Branch b
WHERE s.branchNo = b.branchNo
AND s.position = 'Manager'
AND s.sex = 'M';
```

### 17. Display the numbers of staff (as staffCount) and the salary averages (as avgSalary) of staff in each branch address.

```sql
SELECT b.address, COUNT(*) as staffCount, AVG(s.salary) as avgSalary
FROM Staff s, Branch b
WHERE s.branchNo = b.branchNo
GROUP BY b.address;
```

### 18. Display the numbers of staff (as staffCount) and the salary averages (as avgSalary) of staff in each branch address. Only list data from branches with salary averages between 36500 and 38500.

```sql
SELECT b.address, COUNT(*) as staffCount, AVG(s.salary) as avgSalary
FROM Staff s, Branch b
WHERE s.branchNo = b.branchNo
GROUP BY b.address
HAVING AVG(s.salary) BETWEEN 36500 AND 38500;
```

Note:  
In SQL, you can't directly use aggregate functions like `AVG()` in the `WHERE` clause.  
Instead, you should use the `HAVING` clause to **filter** the results after grouping. The `HAVING` clause is specifically designed to work with aggregate functions to **filter grouped results**.

### 19. List the first name, the last name, the salary, the state, the city (as staffCity), and the city of the branch (as branchCity) of staff members who live and work in the same state. Hint: The WHERE clause should include two conditions; the first condition joins the tables, and the second condition compares the state attribute of the staff with the state attribute of the branch.

```sql
SELECT s.fName, s.lName, s.salary, s.state, s.city AS staffCity, b.city AS branchCity
FROM Staff s
INNER JOIN Branch b
ON s.branchNo = b.branchNo
AND s.state = b.state;
```

fName | lName | salary | state | staffCity | branchCity
------|-------|--------|-------|-----------|-----------
Krista|Allen|48000|NY|Brooklyn|New York
Danny|Chavez|48000|CT|Fairfield|New Haven
Patty|Frazier|51600|CA|Riverside|Los Angeles
Emmett|Garza|36000|NY|Bronx|New York
Lana|Hodges|36000|NY|New York|New York
Lorena|Marsh|48000|CT|New Haven|New Haven
Erik|Olson|24000|CT|New Haven|New Haven
Nina|Scott|36000|NJ|Jersey City|Essex
Owen|Singleton|48000|CA|Los Angeles|Los Angeles
Janice|Underwood|24000|CT|New Haven|New Haven
Edward|Warner|24000|NJ|Essex|Essex
Amos|Wilkerson|24000|CA|Los Angeles|Los Angeles
Kelley|Wood|24000|NJ|Essex|Essex
Brad|Herman|48000|NY|New York|New York
Igor|Strovinsky|24000|NY|Brooklyn|New York

same as:

```sql
SELECT s.fName, s.lName, s.salary, s.state, s.city as staffCity, b.city as branchCity
FROM Staff s, Branch b
WHERE s.branchNo = b.branchNo
AND s.state = b.state;
```

It uses the older style of SQL join syntax, where the join condition is specified in the WHERE clause.
This type of join is often referred to as an implicit join or a cross join with a filter.
This query is functionally equivalent to an inner join.

### 20. List the first name, the last name, the city (as staffCity), the state (as staffState) of staff members who live in a state and work in a different state; include the state of the branch (as branchState) in your SELECT list as well.

```sql
SELECT s.fName, s.lName, s.city as staffCity, s.state as staffState, b.state as branchState
FROM Staff s, Branch b
WHERE s.branchNo = b.branchNo
AND s.state <> b.state;
```

### 21. List all attributes of the branches with no staff members.

```sql
SELECT * FROM Branch WHERE branchNo NOT IN (SELECT branchNo FROM Staff);
```

### 22. Using a left outer join, list the branchNo, the address, the city, and the state of all branches, and the first name, the last name, and the position of any staff members working in these branches, sorted by the branch address in the ascending order.

```sql
SELECT b.branchNo, b.address, b.city, b.state, s.fName, s.lName, s.position
FROM Branch b
LEFT OUTER JOIN Staff s
ON b.branchNo = s.branchNo
ORDER BY b.address ASC;
```

Note:

This query is to perform a `LEFT OUTER JOIN` and will include all branches, regardless of whether they have corresponding staff members.
`ON` versus `WHERE`: the `ON` clause is used to specify how the tables are to be joined - that is, the condition that relates the two tables. The `WHERE` clause, on the other hand, is used to filter the results after the join has been performed.

Disambiguate Column Names: Whenever you have the same column name in multiple tables (e.g., same column names `branchNo`, `address`, `city`, `state` in both table `Branch` and table `Staff`) that are part of your query, you must disambiguate them by using either the full table name or an alias.

Good Practices: Use Aliases for Clarity: In complex queries, especially those involving multiple tables, it's a good practice to use table aliases and prefix your column names with these aliases. It makes your queries more readable and clear.

branchNo | address | city | state | fName | lName | position
---------|---------|------|-------|-------|-------|---------
B006|1471 Jerrold Ave|Philadelphia|PA|||
B005|1725 Roosevelt Ave|Queens|NY|||
B002|18 Harrison Rd|New Haven|CT|Danny|Chavez|Supervisor
B002|18 Harrison Rd|New Haven|CT|Erik|Olson|Assistant
B002|18 Harrison Rd|New Haven|CT|Janice|Underwood|Assistant
B002|18 Harrison Rd|New Haven|CT|Joe|Bryan|Manager
B002|18 Harrison Rd|New Haven|CT|Lorena|Marsh|Manager
B004|22 Canal St|New York|NY|Alisa|Garcia|Assistant
B004|22 Canal St|New York|NY|Brad|Herman|Manager
B004|22 Canal St|New York|NY|Diane|Rogers|Assistant
B004|22 Canal St|New York|NY|Emmett|Garza|Assistant
B004|22 Canal St|New York|NY|Igor|Strovinsky|Assistant
B004|22 Canal St|New York|NY|Krista|Allen|Manager
B004|22 Canal St|New York|NY|Lana|Hodges|Supervisor
B004|22 Canal St|New York|NY|Leslie|Pearson|Manager
B001|366 Tiger Ln|Los Angeles|CA|Amos|Wilkerson|Assistant
B001|366 Tiger Ln|Los Angeles|CA|Jonathon|Bowman|Assistant
B001|366 Tiger Ln|Los Angeles|CA|Owen|Singleton|Manager
B001|366 Tiger Ln|Los Angeles|CA|Patty|Frazier|Supervisor
B001|366 Tiger Ln|Los Angeles|CA|Renee|Figueroa|Assistant
B003|55 Waydell St|Essex|NJ|Charlie|Arnold|Assistant
B003|55 Waydell St|Essex|NJ|Edward|Warner|Assistant
B003|55 Waydell St|Essex|NJ|Jesus|Mann|Manager
B003|55 Waydell St|Essex|NJ|Kelley|Wood|Assistant
B003|55 Waydell St|Essex|NJ|Nina|Scott|Assistant
