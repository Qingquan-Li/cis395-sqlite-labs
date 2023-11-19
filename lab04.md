# Lab 04 - SQL Data Manipulation

## Preliminary Tasks

Execute the following SQL statements to create the following tables and insert sample data into them.
- Libraries  (libraryNo, libraryName, address, city, employees)
- Books 	 (bookNo, title, author, year, price, libraryNo)
- Clients 	 (clientNo, name, age, email)
- RentBooks	 (bookNo, clientNo, dateOut, dateDue)

```sql
CREATE TABLE Libraries (
libraryNo VARCHAR(4),
libraryName VARCHAR(50),
address VARCHAR(50),
city VARCHAR(30),
employees INTEGER,
PRIMARY KEY (libraryNo));

CREATE TABLE Books (
bookNo VARCHAR(4),
title VARCHAR(50),
author VARCHAR(30),
year INTEGER,
price DECIMAL(8,2),
libraryNo VARCHAR(4),
PRIMARY KEY (bookNo));

CREATE TABLE Clients (
clientNo VARCHAR(4),
name VARCHAR(30),
age INTEGER,
email VARCHAR(50),
PRIMARY KEY (clientNo));

CREATE TABLE RentBooks (
bookNo VARCHAR(4),
clientNo VARCHAR(4),
dateOut VARCHAR(10),
dateDue VARCHAR(10),
PRIMARY KEY (bookNo,clientNo,dateOut));

INSERT INTO Libraries VALUES('L100','New York Public Library','476 Fifth Ave','New York',37);
INSERT INTO Libraries VALUES('L200','St Agnes Library','444 Amsterdam Ave','New York',17);
INSERT INTO Libraries VALUES('L300','Boston Public Library','700 Boylston St','Boston',26);
INSERT INTO Libraries VALUES('L400','West End Library','151 Cambridge St','Boston',16);
INSERT INTO Libraries VALUES('L500','South End Library','685 Tremont St','Boston',18);
INSERT INTO Libraries VALUES('L600','Library of Congress','101 Independence Ave','Washington',19);


INSERT INTO Books VALUES('B101','A Handful of Dust','Evelyn Waugh','2004','80.99','L100');
INSERT INTO Books VALUES('B102','A Scanner Darkly','Agatha Christie','1944','39.99','L100');
INSERT INTO Books VALUES('B103','A Time of Gifts','John Steinbeck','1938','52.79','L200');
INSERT INTO Books VALUES('B104','An Evil Cradling','Brian Keenan','1975','44.49','L300');
INSERT INTO Books VALUES('B105','As I Lay Dying','William Faulkner','1981','35.99','L100');
INSERT INTO Books VALUES('B106','Behold the Man','Michael Moorcock','2011','108.49','L300');
INSERT INTO Books VALUES('B107','Butter In a Lordly Dish','Agatha Christie','1949','49.25','L400');
INSERT INTO Books VALUES('B108','Carrion Comfort','Brian Keenan','1967','66.49','L300');
INSERT INTO Books VALUES('B109','Clouds of Witness','Brian Keenan','1969','35.99','L100');
INSERT INTO Books VALUES('B110','Consider the Lilies','Isaac Asimov','1999','49.79','L200');
INSERT INTO Books VALUES('B111','Dying of the Light','George Martin','1981','39.99','L100');
INSERT INTO Books VALUES('B112','East of Eden','John Steinbeck','1940','44.99','L100');
INSERT INTO Books VALUES('B113','Endless Night','Agatha Christie','1952','52.49','L300');
INSERT INTO Books VALUES('B114','Gone with the Wind','Margaret Mitchell','2001','96.49','L300');
INSERT INTO Books VALUES('B115','Great Work of Time','John Crowley','1943','65.25','L400');
INSERT INTO Books VALUES('B116','Mother Night','Kurt Vonnegut','1999','39.25','L400');
INSERT INTO Books VALUES('B117','Mr Standfast','John Buchan','1978','39.49','L300');
INSERT INTO Books VALUES('B118','Nectar in a Sieve','Kamala Markandaya','1966','80.99','L100');
INSERT INTO Books VALUES('B119','No Longer at Ease','Brian Keenan','1971','40.25','L400');
INSERT INTO Books VALUES('B120','Of Human Bondage','Agatha Christie','1947','44.79','L200');
INSERT INTO Books VALUES('B121','Paths of Glory','Agatha Christie','1952','66.99','L100');
INSERT INTO Books VALUES('B122','Postern of Fate','Agatha Christie','1948','35.25','L400');
INSERT INTO Books VALUES('B123','Precious Bane','Mary Webb','1943','15.25','L400');
INSERT INTO Books VALUES('B124','Recalled to Life','William Faulkner','1999','40.49','L300');
INSERT INTO Books VALUES('B125','Shall not Perish','William Faulkner','1978','60.49','L300');
INSERT INTO Books VALUES('B126','Specimen Days','John Steinbeck','1947','66.49','L300');
INSERT INTO Books VALUES('B127','Surprised by Joy','Brian Keenan','1968','60.49','L300');
INSERT INTO Books VALUES('B128','Terrible Swift Sword','Agatha Christie','1944','40.49','L300');
INSERT INTO Books VALUES('B129','That Good Night','John Steinbeck','1945','35.49','L300');
INSERT INTO Books VALUES('B130','The Golden Bowl','Henry James','1971','48.25','L400');
INSERT INTO Books VALUES('B131','The Grapes of Wrath','John Steinbeck','1939','40.79','L200');
INSERT INTO Books VALUES('B132','The Green Bay Tree','Louis Bromfield','1978','63.99','L100');
INSERT INTO Books VALUES('B133','The House of Mirth','Brian Keenan','1966','65.79','L200');
INSERT INTO Books VALUES('B134','The Last Temptation','John Steinbeck','1943','60.99','L100');
INSERT INTO Books VALUES('B135','The Lathe of Heaven','William Faulkner','1986','65.99','L100');
INSERT INTO Books VALUES('B136','The Millstone','Margaret Drabble','2001','70.79','L200');
INSERT INTO Books VALUES('B137','The Moving Finger','Agatha Christie','1943','60.79','L200');
INSERT INTO Books VALUES('B138','The Moving Toyshop','Edmund Crispin','1999','52.25','L400');
INSERT INTO Books VALUES('B139','The Painted Veil','Henry James','1978','50.49','L300');
INSERT INTO Books VALUES('B140','The Proper Study','Isaac Asimov','1994','54.99','L100');
INSERT INTO Books VALUES('B141','Time of our Darkness','William Faulkner','1982','49.25','L400');
INSERT INTO Books VALUES('B142','Vanity Fair','Agatha Christie','1951','65.99','L100');


INSERT INTO Clients VALUES('C201','Kewon Song','36','ksong@gmail.com');
INSERT INTO Clients VALUES('C202','Frank Mancione','14','FMancione@hotmail.com');
INSERT INTO Clients VALUES('C203','Angela Peterkin','66','angela@gmail.com');
INSERT INTO Clients VALUES('C204','Stephanie Johnson','16','sjohnson@gmail.com');
INSERT INTO Clients VALUES('C205','Rafael Bah','17','rbah@yahoo.com');
INSERT INTO Clients VALUES('C206','Leisa Aras','49',NULL);
INSERT INTO Clients VALUES('C207','Robert Salsberry','55','rsalsberry@hotmail.com');
INSERT INTO Clients VALUES('C208','Alfina Chanti','24',NULL);
INSERT INTO Clients VALUES('C209','Connie Profaci','32','cprofaci@juno.com');
INSERT INTO Clients VALUES('C210','Steven Plac','17','steven@yahoo.com');
INSERT INTO Clients VALUES('C211','Steven Plac','17','steven@yahoo.com');
INSERT INTO Clients VALUES('C212','Cindy Lyon','20','cindy.lyon@hotmail.com');
INSERT INTO Clients VALUES('C213','Nicole Gary','26','ngary@gmail.com');
INSERT INTO Clients VALUES('C214','Cindy Lyon','20','cindy.lyon@hotmail.com');


INSERT INTO RentBooks VALUES('B102','C201','10/24/2021','11/07/2021');
INSERT INTO RentBooks VALUES('B106','C201','10/25/2021','11/08/2021');
INSERT INTO RentBooks VALUES('B110','C201','10/19/2021','11/02/2021');
INSERT INTO RentBooks VALUES('B114','C201','10/15/2021','10/29/2021');
INSERT INTO RentBooks VALUES('B118','C201','10/24/2021','11/07/2021');
INSERT INTO RentBooks VALUES('B122','C203','10/15/2021','10/29/2021');
INSERT INTO RentBooks VALUES('B126','C202','10/10/2021','10/24/2021');
INSERT INTO RentBooks VALUES('B130','C202','10/01/2021','10/15/2021');
INSERT INTO RentBooks VALUES('B134','C202','10/08/2021','10/22/2021');
INSERT INTO RentBooks VALUES('B134','C202','10/22/2021','11/05/2021');
INSERT INTO RentBooks VALUES('B138','C202','10/18/2021','11/01/2021');
INSERT INTO RentBooks VALUES('B142','C201','10/25/2021','11/08/2021');
INSERT INTO RentBooks VALUES('B103','C204','10/01/2020','10/15/2020');
INSERT INTO RentBooks VALUES('B106','C203','09/22/2021','10/05/2021');
INSERT INTO RentBooks VALUES('B109','C204','10/01/2020','10/15/2020');
INSERT INTO RentBooks VALUES('B112','C204','10/24/2021','11/07/2021');
INSERT INTO RentBooks VALUES('B115','C203','10/22/2021','11/05/2021');
INSERT INTO RentBooks VALUES('B130','C203','10/15/2021','10/29/2021');
INSERT INTO RentBooks VALUES('B133','C204','09/22/2021','10/05/2021');
INSERT INTO RentBooks VALUES('B136','C204','10/19/2021','11/02/2021');
INSERT INTO RentBooks VALUES('B139','C204','10/24/2021','11/07/2021');
INSERT INTO RentBooks VALUES('B130','C205','10/29/2021','11/12/2021');
INSERT INTO RentBooks VALUES('B133','C205','10/15/2021','10/29/2021');
INSERT INTO RentBooks VALUES('B136','C205','10/01/2021','10/15/2021');
INSERT INTO RentBooks VALUES('B139','C205','09/25/2021','10/08/2021');
INSERT INTO RentBooks VALUES('B103','C212','10/18/2020','11/01/2020');
INSERT INTO RentBooks VALUES('B105','C212','10/18/2021','11/01/2021');
INSERT INTO RentBooks VALUES('B107','C207','10/24/2021','11/07/2021');
INSERT INTO RentBooks VALUES('B109','C203','10/22/2020','11/05/2020');
INSERT INTO RentBooks VALUES('B111','C209','10/18/2021','11/01/2021');
INSERT INTO RentBooks VALUES('B113','C209','10/05/2021','10/19/2021');
INSERT INTO RentBooks VALUES('B113','C209','10/19/2021','11/02/2021');
INSERT INTO RentBooks VALUES('B113','C209','11/02/2021','11/16/2021');
INSERT INTO RentBooks VALUES('B115','C209','10/01/2021','10/15/2021');
INSERT INTO RentBooks VALUES('B117','C209','10/10/2021','10/24/2021');
INSERT INTO RentBooks VALUES('B119','C207','10/11/2021','10/25/2021');
INSERT INTO RentBooks VALUES('B119','C207','10/25/2021','11/08/2021');
INSERT INTO RentBooks VALUES('B121','C207','10/10/2021','10/24/2021');
INSERT INTO RentBooks VALUES('B123','C212','10/15/2021','10/29/2021');
INSERT INTO RentBooks VALUES('B125','C207','10/19/2021','11/02/2021');
INSERT INTO RentBooks VALUES('B127','C207','10/22/2021','11/05/2021');
INSERT INTO RentBooks VALUES('B129','C207','10/24/2021','11/07/2021');
INSERT INTO RentBooks VALUES('B131','C212','10/10/2021','10/24/2021');
INSERT INTO RentBooks VALUES('B133','C212','10/29/2021','11/12/2021');
INSERT INTO RentBooks VALUES('B135','C203','10/24/2021','11/07/2021');
```


## Lab Tasks

### 1. List the name and the email of all clients sorted by name.

```sql
SELECT name, email FROM Clients ORDER BY name;
```

### 2. Display the total number of employees (as empTotal) from New York and Washington libraries. You will need to use the SUM aggregate function to accomplish this task.

```sql
SELECT SUM(employees) AS empTotal FROM Libraries WHERE city IN ('New York', 'Washington');
```

or:

```sql
SELECT SUM(employees) AS empTotal FROM Libraries WHERE city = 'New York' OR city = 'Washington';
```

### 3. Display the number and the average price of books written by Agatha Christie; rename the fields using booksCount and avgPrice, respectively.

```sql
SELECT COUNT(*) AS booksCount, AVG(price) AS avgPrice FROM Books WHERE author = 'Agatha Christie';
```

~~SELECT COUNT(bookNo) AS booksCount, AVG(price) AS avgPrice FROM Books WHERE author = 'Agatha Christie';~~

### 4. Display the number, the min price, and the max price of books in each library; rename the fields using booksCount, minPrice, and maxPrice, respectively.

```sql
SELECT libraryNo, COUNT(*) AS booksCount, MIN(price) AS minPrice, MAX(price) AS maxPrice
FROM Books
GROUP BY libraryNo;
```

### 5. Display for each city with more than 1 library, the number of libraries and the total number of employees; rename the fields using libCount and empTotal, respectively.

```sql
SELECT city, COUNT(*) AS libCount, SUM(employees) AS empTotal
FROM Libraries
GROUP BY city
HAVING COUNT(*) > 1;
```

~~ `SELECT city, COUNT(*) AS libCount, SUM(employees) AS empTotal FROM Libraries GROUP BY city WHERE COUNT(*) > 1;` ~~
Note:  
In SQL, you can't directly use aggregate functions like `COUNT()` in the `WHERE` clause.  
Instead, you should use the `HAVING` clause to **filter** the results after grouping. The `HAVING` clause is specifically designed to work with aggregate functions to **filter grouped results**.

### 6. Display the number of books rented in each day (as rentCount). Note: dateOut is the attribute that indicates when a book has been rented.

```sql
SELECT dateOut, COUNT(*) AS rentCount FROM RentBooks GROUP BY dateOut;
```

### 7. For the books that were rented more than once in the month of October 2021, display the number of times, the first dateOut, and the last dateOut the book was rented in that month; rename the fields using rentCount, firstDate, and lastDate, respectively.
Hints: 
- To find the dates for October 2021, you can either use a pattern match search condition (i.e. LIKE) or a range search condition (i.e. BETWEEN).
- Create groups for each bookNo (i.e. GROUP BY).
- Use a condition to display data for groups with more than one record (i.e. HAVING).

```sql
SELECT bookNo, COUNT(*) AS rentCount, MIN(dateOut) AS firstDate, MAX(dateOut) AS lastDate
FROM RentBooks
WHERE dateOut LIKE '10/__/2021'
GROUP BY bookNo
HAVING COUNT(*) > 1;
```

or:

```sql
SELECT bookNo, COUNT(*) AS rentCount, MIN(dateOut) AS firstDate, MAX(dateOut) AS lastDate
FROM RentBooks
WHERE dateOut BETWEEN '10/01/2021' AND '10/31/2021'
GROUP BY bookNo
HAVING COUNT(*) > 1;
```

Note:
The `Where` clause is used to filter records from a result. It shoule be used before `Group By` clause.
The `Having` clause is used to filter records from a group. It should be used after `Group By` clause.


### 8. Display the bookNo of the books that were rented more than once by the same client. Include the clientNo and the number of times the client rented the book (as rentCount). Hint: Each bookNo and clientNo combination is a group.

```sql
SELECT bookNo, clientNo, COUNT(*) AS rentCount
FROM RentBooks
GROUP BY bookNo, clientNo
HAVING COUNT(*) > 1;
```

### 9. List full details of libraries that have no books.

```sql
SELECT * FROM Libraries WHERE libraryNo NOT IN (SELECT libraryNo FROM Books);
```

### 10. List full details of Agatha Christie books that have never been rented.

```sql
SELECT * FROM Books
WHERE author = 'Agatha Christie'
AND bookNo NOT IN (SELECT bookNo FROM RentBooks);
```

### 11. List the author, the title, and the library name of all books from New York libraries; sorted in the ascending order of the author and the title.

```sql
SELECT b.author, b.title, l.libraryName
FROM Books b, Libraries l
WHERE b.libraryNo = l.libraryNo
AND l.city = 'New York'
ORDER BY b.author, b.title ASC;
```

Note: Don't forget the clause `b.libraryNo = l.libraryNo` in the `WHERE` clause. Otherwise, you will get a Cartesian product.
It uses the older style of SQL join syntax, where the join condition is specified in the WHERE clause.
This type of join is often referred to as an implicit join or a cross join with a filter.
This query is functionally equivalent to an inner join.

or:

```sql
SELECT author, title, libraryName
FROM Books
INNER JOIN Libraries ON Books.libraryNo = Libraries.libraryNo
WHERE city = 'New York'
ORDER BY author, title;
```

### 12. Display the number of books for each libraryName (as booksCount). 

```sql
SELECT libraryName, COUNT(*) AS booksCount
FROM Books
INNER JOIN Libraries ON Books.libraryNo = Libraries.libraryNo
GROUP BY libraryName;
```

or:
    
```sql
SELECT libraryName, COUNT(*) AS booksCount
FROM Books, Libraries
WHERE Books.libraryNo = Libraries.libraryNo
GROUP BY libraryName;
```

### 13. Display the number of books in New York Public Library and the sum of their prices; rename the fields using booksCount and totalPrice, respectively. Note: You should include 'New York Public Library' in your query. 

```sql
SELECT COUNT(*) AS booksCount, SUM(price) AS totalPrice
FROM Books
INNER JOIN libraries ON Books.libraryNo = Libraries.libraryNo
WHERE libraryName = 'New York Public Library';
```

### 14. List the name and age of clients who rented the books that need to be returned on 10/15/2021, sorted in the ascending orders of the client name. Include the title of the books in the list.

```sql
SELECT c.name, c.age, b.title
FROM Clients c
INNER JOIN RentBooks r on c.clientNo = r.clientNo
INNER JOIN Books b on r.bookNo = b.bookNo
WHERE r.dateDue = '10/15/2021'
ORDER BY c.name;
```

or:

```sql
SELECT c.name, c.age, b.title
FROM Clients c, Books b, RentBooks r
WHERE c.clientNo = r.clientNo
AND b.bookNo = r.bookNo
AND r.dateDue = '10/15/2021'
ORDER BY c.name;
```

### 15. For libraries located in Boston, list the library names, the titles and prices of the books that are rented from these libraries, the dateOut and the names of the clients who rented the books, sorted in the ascending order of the library name and the descending order of the dateOut.

```sql
SELECT l.libraryName, b.title, b.price, r.dateOut, c.name
FROM Libraries l
INNER JOIN Books b ON l.libraryNo = b.libraryNo
INNER JOIN RentBooks r ON b.bookNo = r.bookNo
INNER JOIN Clients c ON r.clientNo = c.clientNo
WHERE l.city = 'Boston'
ORDER BY l.libraryName ASC, r.dateOut DESC;
```

or:

```sql
SELECT l.libraryName, b.title, b.price, r.dateOut, c.name
FROM Libraries l, Books b, RentBooks r, Clients c
WHERE l.libraryNo = b.libraryNo
AND b.bookNo = r.bookNo
AND r.clientNo = c.clientNo
AND l.city = 'Boston'
ORDER BY l.libraryName, r.dateOut DESC;
```

### 16. Write the SQL statement that deletes all records from the RentBooks table.

```sql
DELETE FROM RentBooks;
```

### 17. Write the UPDATE SQL statement that doubles the number of employees in Boston libraries.


```sql
UPDATE Libraries
SET employees = employees * 2
WHERE city = 'Boston';
```

---

**Note: The following tasks are optional.**


### 18. Using a LEFT JOIN, list full details of libraries that have no books. Note: You may have already provided the answer to this task using a subquery (Task 9). Here you need to use a left outer join.

```sql
SELECT * FROM Libraries WHERE libraryNo NOT IN (SELECT libraryNo FROM Books);
```

Using a LEFT JOIN:

```sql
SELECT l.libraryNo, l.libraryName, l.address, l.city, l.employees
FROM Libraries l
LEFT OUTER JOIN Books b ON l.libraryNo = b.libraryNo
WHERE b.bookNo IS NULL;
```

### 19. By mistake some clients were inserted more than once with different clientNo. Display the details of duplicated clients.

```sql
SELECT * FROM Clients
WHERE name IN (SELECT name FROM Clients GROUP BY name HAVING COUNT(*) > 1);
```

### 20. Delete from the Clients table all duplications. Notes: Your delete statement should keep one single occurrence of each client, and delete the duplicates. The statement should be able to delete additional occurrences for any duplicate client (not just for Steven Plac and Cindy Lyon).

```sql
DELETE FROM Clients
WHERE clientNo NOT IN (SELECT MIN(clientNo) FROM Clients GROUP BY name);
```
