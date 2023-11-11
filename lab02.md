# Lab 02

## Preliminary Tasks

Execute the following code. This code will create the table Agents and insert sample data into it.
List the content of the Agents table and make sure data was properly inserted. The total number of records should be 12.

```sql
CREATE TABLE Agents (
agentNo VARCHAR(4),
fName VARCHAR(20),
lName VARCHAR(20),
branchNo VARCHAR(4),
salary DECIMAL(8,2),
dob DATE,
address VARCHAR(50),
city VARCHAR(30),
state VARCHAR(2),
phone VARCHAR(20),
email VARCHAR(50),
PRIMARY KEY (agentNo));

INSERT INTO Agents VALUES('A471','Jess','Chaffins','B002','55000','13-MAY-1969','18 3rd Ave','New York','NY','212-510-4633','jess.chaffins@chaffins.org');
INSERT INTO Agents VALUES('A181','Jose','Stockham','B005','58000','08-JAN-1981','82 N Highway 67','San Diego','CA','925-634-7158','jose81@gmail.com');
INSERT INTO Agents VALUES('A271','Haydee','Denooyer','B002','40000','12-JUN-1988','53 Hamilton Pl','New York','NY','212-792-8658','hdenooyer@denooyer.org');
INSERT INTO Agents VALUES('A208','Alis','Baltimore','B005','44000','14-FEB-1982','1128 Delaware St','San Jose','CA','408-504-3552','abaltimore@cox.net');
INSERT INTO Agents VALUES('A130','Bok','Isaacs','B002','46000','18-OCT-1984','6 Gilson St','Bronx','NY','347-212-3762',NULL);
INSERT INTO Agents VALUES('A380','Gayla','Schnitzler','B005','30000','28-JUL-1989','38 Pleasant Hill Rd','Hayward','CA',NULL,'gschnitzler@gmail.com');
INSERT INTO Agents VALUES('A076','Moon','Parlato','B003','36000','10-APR-1994','749 Brandon St','Wellsville','NY','585-866-8313','moon@yahoo.com');
INSERT INTO Agents VALUES('A487','Dorothy','Chesterfield','B007','30000','15-JAN-1997','469 Outwater Ln','San Diego','CA','858-617-2124','dorothy97@aol.com');
INSERT INTO Agents VALUES('A037','Marguerita','Hiatt','B003','39000','08-DEC-1986','14728 Amsterdam Ave','New York','NY','212-675-8570','marguerita.hiatt@gmail.com');
INSERT INTO Agents VALUES('A430','Anna','Husser','B002','42000','08-JUN-1987','9 State Highway 57','Jersey City','NJ','201-991-8369','anna.husser@cox.net');
INSERT INTO Agents VALUES('A102','Louisa','Cronauer','B007','48000','03-MAR-1993','524 Louisiana Ave','San Jose','CA','510-828-7047','louisa@cronauer.org');
INSERT INTO Agents VALUES('A317','Barbra','Adkin','B002','60000','28-AUG-1974','4 Kohler Memorial Dr','Brooklyn','NY','718-201-3751',NULL);
```

```sql
SELECT * FROM Agents;
```

agentNo | fName | lName | branchNo | salary | dob | address | city | state | phone | email
--------|-------|-------|----------|--------|-----|---------|------|-------|-------|------
A471|Jess|Chaffins|B002|55000|13-MAY-1969|18 3rd Ave|New York|NY|212-510-4633|jess.chaffins@chaffins.org
A181|Jose|Stockham|B005|58000|08-JAN-1981|82 N Highway 67|San Diego|CA|925-634-7158|jose81@gmail.com
A271|Haydee|Denooyer|B002|40000|12-JUN-1988|53 Hamilton Pl|New York|NY|212-792-8658|hdenooyer@denooyer.org
A208|Alis|Baltimore|B005|44000|14-FEB-1982|1128 Delaware St|San Jose|CA|408-504-3552|abaltimore@cox.net
A130|Bok|Isaacs|B002|46000|18-OCT-1984|6 Gilson St|Bronx|NY|347-212-3762|
A380|Gayla|Schnitzler|B005|30000|28-JUL-1989|38 Pleasant Hill Rd|Hayward|CA||gschnitzler@gmail.com
A076|Moon|Parlato|B003|36000|10-APR-1994|749 Brandon St|Wellsville|NY|585-866-8313|moon@yahoo.com
A487|Dorothy|Chesterfield|B007|30000|15-JAN-1997|469 Outwater Ln|San Diego|CA|858-617-2124|dorothy97@aol.com
A037|Marguerita|Hiatt|B003|39000|08-DEC-1986|14728 Amsterdam Ave|New York|NY|212-675-8570|marguerita.hiatt@gmail.com
A430|Anna|Husser|B002|42000|08-JUN-1987|9 State Highway 57|Jersey City|NJ|201-991-8369|anna.husser@cox.net
A102|Louisa|Cronauer|B007|48000|03-MAR-1993|524 Louisiana Ave|San Jose|CA|510-828-7047|louisa@cronauer.org
A317|Barbra|Adkin|B002|60000|28-AUG-1974|4 Kohler Memorial Dr|Brooklyn|NY|718-201-3751|

---

## Lab Tasks

### 1. List the first name, the last name, the state, and the salary of all agents.

```sql
SELECT fName, lName, state, salary FROM Agents;
```

fName | lName | state | salary
------|-------|-------|-------
Jess|Chaffins|NY|55000
Jose|Stockham|CA|58000
Haydee|Denooyer|NY|40000
Alis|Baltimore|CA|44000
Bok|Isaacs|NY|46000
Gayla|Schnitzler|CA|30000
Moon|Parlato|NY|36000
Dorothy|Chesterfield|CA|30000
Marguerita|Hiatt|NY|39000
Anna|Husser|NJ|42000
Louisa|Cronauer|CA|48000
Barbra|Adkin|NY|60000

### 2. List the first name, the last name, the state, and the salary of all agents sorted in the descending order of the salary.

```sql
SELECT fName, lName, state, salary FROM Agents ORDER BY salary DESC;
```

fName | lName | state | salary
------|-------|-------|-------
Barbra|Adkin|NY|60000
Jose|Stockham|CA|58000
Jess|Chaffins|NY|55000
Louisa|Cronauer|CA|48000
Bok|Isaacs|NY|46000
Alis|Baltimore|CA|44000
Anna|Husser|NJ|42000
Haydee|Denooyer|NY|40000
Marguerita|Hiatt|NY|39000
Moon|Parlato|NY|36000
Gayla|Schnitzler|CA|30000
Dorothy|Chesterfield|CA|30000

### 3. List the first name, the last name, the state, and the salary of all agents sorted in the ascending order of the state and the descending order of the salary.

```sql
SELECT fName, lName, state, salary FROM Agents ORDER BY state ASC, salary DESC;
```

Or:

```sql
SELECT fName, lName, state, salary FROM Agents ORDER BY state, salary DESC;
```

fName | lName | state | salary
------|-------|-------|-------
Jose|Stockham|CA|58000
Louisa|Cronauer|CA|48000
Alis|Baltimore|CA|44000
Gayla|Schnitzler|CA|30000
Dorothy|Chesterfield|CA|30000
Anna|Husser|NJ|42000
Barbra|Adkin|NY|60000
Jess|Chaffins|NY|55000
Bok|Isaacs|NY|46000
Haydee|Denooyer|NY|40000
Marguerita|Hiatt|NY|39000
Moon|Parlato|NY|36000

### 4. List the cities (without duplications) of agents living in California State (CA).

```sql
SELECT DISTINCT city FROM Agents WHERE state = 'CA';
```

city |
-----|
San Diego
San Jose
Hayward

### 5. Produce a list, for agents living in California, showing the first name, the last name, the state, the salary, and the monthly salary. Use the AS clause to rename the last two columns with yearlySalary and monthlySalary, respectively. Note: The salary attribute in the Agents table contains annual salaries of agents.

```sql
SELECT fName, lName, state, salary AS yearlySalary, salary/12 AS monthlySalary FROM Agents WHERE state = 'CA';
```

fName | lName | state | yearlySalary | monthlySalary
------|-------|-------|--------------|---------------
Jose|Stockham|CA|58000|4833
Alis|Baltimore|CA|44000|3666
Gayla|Schnitzler|CA|30000|2500
Dorothy|Chesterfield|CA|30000|2500
Louisa|Cronauer|CA|48000|4000

### 6. List the first name, the last name, the city, the state, and the salary of agents with salaries greater than 50000 and living in New York State (NY).

```sql
SELECT fName, lName, city, state, salary FROM Agents WHERE salary > 50000 AND state = 'NY';
```

fName | lName | city | state | salary
------|-------|------|-------|-------
Jess|Chaffins|New York|NY|55000
Barbra|Adkin|Brooklyn|NY|60000

### 7. List the first name, the last name, the city, the state, and the salary of all agents with salaries between 39000 and 50000.

```sql
SELECT fName, lName, city, state, salary FROM Agents WHERE salary BETWEEN 39000 AND 50000;
```

fName | lName | city | state | salary
------|-------|------|-------|-------
Haydee|Denooyer|New York|NY|40000
Alis|Baltimore|San Jose|CA|44000
Bok|Isaacs|Bronx|NY|46000
Marguerita|Hiatt|New York|NY|39000
Anna|Husser|Jersey City|NJ|42000
Louisa|Cronauer|San Jose|CA|48000

### 8. List the first name, the last name, the city, the state and the salary of all agents with salaries outside the range [39000 - 50000] sorted in ascending order of salary.

```sql
SELECT fName, lName, city, state, salary FROM Agents WHERE salary NOT BETWEEN 39000 AND 50000 ORDER BY salary ASC;
```

fName | lName | city | state | salary
------|-------|------|-------|-------
Gayla|Schnitzler|Hayward|CA|30000
Dorothy|Chesterfield|San Diego|CA|30000
Moon|Parlato|Wellsville|NY|36000
Jess|Chaffins|New York|NY|55000
Jose|Stockham|San Diego|CA|58000
Barbra|Adkin|Brooklyn|NY|60000

### 9. List the first name, the last name, the address, the city, the state, and the salary of all agents who do not live in New York State (NY). Note: To express the SQL Not Equal comparison operator (≠), You can use either != or <>

```sql
SELECT fName, lName, address, city, state, salary FROM Agents WHERE state != 'NY';
```

Or:

```sql
SELECT fName, lName, address, city, state, salary FROM Agents WHERE state <> 'NY';
```

fName | lName | address | city | state | salary
------|-------|---------|------|-------|-------
Jose|Stockham|82 N Highway 67|San Diego|CA|58000
Alis|Baltimore|1128 Delaware St|San Jose|CA|44000
Gayla|Schnitzler|38 Pleasant Hill Rd|Hayward|CA|30000
Dorothy|Chesterfield|469 Outwater Ln|San Diego|CA|30000
Anna|Husser|9 State Highway 57|Jersey City|NJ|42000
Louisa|Cronauer|524 Louisiana Ave|San Jose|CA|48000

### 10. List the first name, the last name, the address, the city, the state, and the salary of agents living in California or New York with salaries greater than 50000.

```sql
SELECT fName, lName, address, city, state, salary FROM Agents WHERE (state = 'CA' OR state = 'NY') AND salary > 50000;
```

fName | lName | address | city | state | salary
------|-------|---------|------|-------|-------
Jess|Chaffins|18 3rd Ave|New York|NY|55000
Jose|Stockham|82 N Highway 67|San Diego|CA|58000
Barbra|Adkin|4 Kohler Memorial Dr|Brooklyn|NY|60000

### 11. List the first name, the last name, the branchNo, the city, and the state of agents who do not work in the branches B002 and B005.

```sql
SELECT fName, lName, branchNo, city, state FROM Agents WHERE branchNo NOT IN ('B002', 'B005');
```

Or:

```sql
SELECT fName, lName, branchNo, city, state FROM Agents WHERE branchNo != 'B002' AND branchNo != 'B005';
```

Or:

```sql
SELECT fName, lName, branchNo, city, state FROM Agents WHERE branchNo <> 'B002' AND branchNo <> 'B005';
```

fName | lName | branchNo | city | state
------|-------|----------|------|-------
Moon|Parlato|B003|Wellsville|NY
Dorothy|Chesterfield|B007|San Diego|CA
Marguerita|Hiatt|B003|New York|NY
Louisa|Cronauer|B007|San Jose|CA

### 12. List the first name, the last name, the phone, the city, and the state of agents with phone numbers starting with 212.

```sql
SELECT fName, lName, phone, city, state FROM Agents WHERE phone LIKE '212%';
```

fName | lName | phone | city | state
------|-------|-------|------|-------
Jess|Chaffins|212-510-4633|New York|NY
Haydee|Denooyer|212-792-8658|New York|NY
Marguerita|Hiatt|212-675-8570|New York|NY

### 13. List the first name, the last name, the address, the city, and the state of agents having the word Highway in their addresses.

```sql
SELECT fName, lName, address, city, state FROM Agents WHERE address LIKE '%Highway%';
```

fName | lName | address | city | state
------|-------|---------|------|-------
Jose|Stockham|82 N Highway 67|San Diego|CA
Anna|Husser|9 State Highway 57|Jersey City|NJ

### 14. List the first name, the last name, the date of birth, the city, and the state of agents born in the month of June or July. Note: Use a pattern match search condition to find the words JUN or JUL in the date of birth attribute.

```sql
SELECT fName, lName, dob, city, state FROM Agents WHERE dob LIKE '%JUN%' OR dob LIKE '%JUL%';
```

fName | lName | dob | city | state
------|-------|-----|------|-------
Haydee|Denooyer|12-JUN-1988|New York|NY
Gayla|Schnitzler|28-JUL-1989|Hayward|CA
Anna|Husser|08-JUN-1987|Jersey City|NJ

### 15. List the first name, the last name, the date of birth, and the salary of agents with first names having exactly four letters sorted in descending order of salary. Note: To do this, use the pattern match symbol underscore; remember that an underscore represents any single character.

```sql
SELECT fName, lName, dob, salary FROM Agents WHERE fName LIKE '____' ORDER BY salary DESC;
```

fName | lName | dob | salary
------|-------|-----|-------
Jose|Stockham|08-JAN-1981|58000
Jess|Chaffins|13-MAY-1969|55000
Alis|Baltimore|14-FEB-1982|44000
Anna|Husser|08-JUN-1987|42000
Moon|Parlato|10-APR-1994|36000

### 16. List the first name, the last name, the branchNo, and the email of agents working in the branch B005 and having email addresses from gmail.com.

```sql
SELECT fName, lName, branchNo, email FROM Agents WHERE branchNo = 'B005' AND email LIKE '%gmail.com';
```

fName | lName | branchNo | email
------|-------|----------|------
Jose|Stockham|B005|jose81@gmail.com
Gayla|Schnitzler|B005|gschnitzler@gmail.com

### 17. List the first name, the last name, the city, the state, and the email of agents living in California State and having email addresses ending in extensions other than .com.

```sql
SELECT fName, lName, city, state, email FROM Agents WHERE state = 'CA' AND email NOT LIKE '%.com';
```

fName | lName | city | state | email
------|-------|------|-------|------
Alis|Baltimore|San Jose|CA|abaltimore@cox.net
Louisa|Cronauer|San Jose|CA|louisa@cronauer.org

### 18. List the first name, the last name, the city, the state, the phone, and the email of agents with empty (NULL) email addresses.

```sql
SELECT fName, lName, city, state, phone, email FROM Agents WHERE email IS NULL;
```

fName | lName | city | state | phone | email
------|-------|------|-------|-------|------
Bok|Isaacs|Bronx|NY|347-212-3762|
Barbra|Adkin|Brooklyn|NY|718-201-3751|


### 19. Use the COUNT aggregate function to display the total number of agents. Use the AS clause to rename the output with agentCount.

```sql
SELECT COUNT(*) AS agentCount FROM Agents;
```

agentCount |
-----------|
12

### 20. Display the minimum, the average, and the maximum salaries of all agents. Rename the outputs with minSalary, avgSalary, and maxSalary, respectively.

```sql
SELECT MIN(salary) AS minSalary, AVG(salary) AS avgSalary, MAX(salary) AS maxSalary FROM Agents;
```

minSalary | avgSalary | maxSalary
----------|-----------|----------
30000|44000.0|60000

### 21. Display the number of agents living in New York State (NY) and the sum of their salaries. Rename the outputs with agentCount and sumSalary, respectively.

```sql
SELECT COUNT(*) AS agentCount, SUM(salary) AS sumSalary FROM Agents WHERE state = 'NY';
```

agentCount | sumSalary
-----------|----------
6|276000

### 22. Display the number of agents who work in the branch B002 and have salaries greater than 40000. Rename the output with agentCount.

```sql
SELECT COUNT(*) AS agentCount FROM Agents WHERE branchNo = 'B002' AND salary > 40000;
```

agentCount |
-----------|
4

### 23. Display, in each state, the number of agents sorted in the descending order. Rename the numbers of agents with myCount.

```sql
SELECT state, COUNT(*) AS myCount FROM Agents GROUP BY state ORDER BY myCount DESC;
```

state | myCount
------|--------
NY|6
CA|5
NJ|1


### 24. Display the number of agents in each branch and the sum of their salaries. Rename the last two columns of the outputs with agentCount and sumSalary, respectively.

```sql
SELECT branchNo, COUNT(*) AS agentCount, SUM(salary) AS sumSalary FROM Agents GROUP BY branchNo;
```

branchNo | agentCount | sumSalary
---------|------------|----------
B002|5|243000
B003|2|75000
B005|3|132000
B007|2|78000

### 25. In each branch, display the number of agents living in New York or California and the average of their salaries. Rename the last two columns of the outputs with agentCount and avgSalary, respectively.

```sql
SELECT branchNo, COUNT(*) AS agentCount, AVG(salary) AS avgSalary FROM Agents WHERE state IN ('NY', 'CA') GROUP BY branchNo;
```

Or:

```sql
SELECT branchNo, COUNT(*) AS agentCount, AVG(salary) AS avgSalary FROM Agents WHERE state = 'NY' OR state = 'CA' GROUP BY branchNo;
```

### 26. Exclude, from the list you displayed in the previous task, the branches that have salary averages less than 40000. This means only display data for branches with average salaries greater than or equal to 40000.

```sql
SELECT branchNo, COUNT(*) AS agentCount, AVG(salary) AS avgSalary FROM Agents WHERE state IN ('NY', 'CA') GROUP BY branchNo HAVING avgSalary >= 40000;
```

Or:

```sql
SELECT branchNo, COUNT(*) AS agentCount, AVG(salary) AS avgSalary FROM Agents WHERE state = 'NY' OR state = 'CA' GROUP BY branchNo HAVING avgSalary >= 40000;
```

~~SELECT branchNo, COUNT(*) AS agentCount, AVG(salary) AS avgSalary FROM Agents WHERE state IN ('NY', 'CA') AND avgSalary >= 40000 GROUP BY branchNo;~~

Note:  
In SQL, you can't directly use aggregate functions like `AVG()` in the `WHERE` clause.  
Instead, you should use the `HAVING` clause to **filter** the results after grouping. The `HAVING` clause is specifically designed to work with aggregate functions to **filter grouped results**.

branchNo | agentCount | avgSalary
---------|------------|----------
B002|4|50250.0
B005|3|44000.0
