# Lab 01

## Preliminary Tasks

Copy and paste the following code into your SQL Editor, then execute it. This code will create the table Branches and insert the above five records into it.

```sql
CREATE TABLE Branches (
branchNo VARCHAR(4),
street VARCHAR(20),
city VARCHAR(15),
postcode VARCHAR(10),
employees INTEGER,
PRIMARY KEY (branchNo));

INSERT INTO Branches VALUES('B005','22 Deer Rd','London','SW14EH',18);
INSERT INTO Branches VALUES('B007','189 Hudson St','New York','10013',22);
INSERT INTO Branches VALUES('B003','81 Stepford Dr','Glasgow','G119QX',12);
INSERT INTO Branches VALUES('B004','250 Fifth Ave','New York','10001',32);
INSERT INTO Branches VALUES('B002','56 Clover St','London','NW16EU',26);
```

Note: To recreate the table, you will need to drop it first by running the following command.

```sql
DROP TABLE Branches;
```

To make sure all records are properly inserted, list the content of the Branches table by running the following statement.

```sql
SELECT * FROM Branches;
```

---

## Lab Tasks

### 1. Write the SQL statement that lists the cities of the branches

```sql
SELECT city FROM Branches;
```

city |
--------|
London
New York
Glasgow
New York
London

### 2. Write the SQL statement that lists the cities of the branches without duplicates

```sql
SELECT DISTINCT city FROM Branches;
```

city |
--------|
London
New York
Glasgow

### 3. Write the SQL statement that lists the city and the employees sorted in the descending order of employees

```sql
SELECT city, employees FROM Branches ORDER BY employees DESC;
```

city     | employees
-------- | ---------
New York|32
London|26
New York|22
London|18
Glasgow|12

### 4. Write the SQL statement that lists the city and the employees sorted in the ascending order of city

```sql
SELECT city, employees FROM Branches ORDER BY city;

-- Or
SELECT city, employees FROM Branches ORDER BY city ASC;
```

city     | employees
-------- | ---------
Glasgow|12
London|18
London|26
New York|22
New York|32

### 5. Write the SQL statement that lists the branchNo, the street, the city, and the employees of branches with more than 20 employees

```sql
SELECT branchNo, street, city, employees FROM Branches WHERE employees > 20;
```

branchNo | street | city     | employees
-------- | ------ | -------- | ---------
B007|189 Hudson St|New York|22
B004|250 Fifth Ave|New York|32
B002|56 Clover St|London|26

### 6. Write the SQL statement that lists the postcode of branches from New York

```sql
SELECT postcode FROM Branches WHERE city = 'New York';
```

postcode |
-------- |
10013
10001

### 7. Write the SQL statement that lists the branchNo, the street, and the city of branches from London or Glasgow cities

```sql
SELECT branchNo, street, city FROM Branches WHERE city = 'London' OR city = 'Glasgow';
```

branchNo | street | city
-------- | ------ | --------
B005|22 Deer Rd|London
B003|81 Stepford Dr|Glasgow
B002|56 Clover St|London

### 8. Write the SQL statement that lists all the attributes of the New York branch with more than 30 employees

```sql
SELECT * FROM Branches WHERE city = 'New York' AND employees > 30;
```

branchNo | street | city     | postcode | employees
-------- | ------ | -------- | -------- | ---------
B004|250 Fifth Ave|New York|10001|32

### 9. Write the SQL statement that lists the branchNo, the street, the city, and the employees of branches with number of employees between 18 and 30

```sql
SELECT branchNo, street, city, employees FROM Branches WHERE employees BETWEEN 18 AND 30;
```

branchNo | street | city     | employees
-------- | ------ | -------- | ---------
B005|22 Deer Rd|London|18
B007|189 Hudson St|New York|22
B002|56 Clover St|London|26

### 10. Write the SQL statement that lists the branchNo, the street, and the city of branches located in addresses ending with St

```sql
SELECT branchNo, street, city FROM Branches WHERE street LIKE '%St';
```

branchNo | street | city
-------- | ------ | --------
B007|189 Hudson St|New York
B002|56 Clover St|London
