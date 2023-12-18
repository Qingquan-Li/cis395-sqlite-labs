# Lab 08 - SQL Data Definition

## Create a new database (lab08) inside the Docker container

```bash
# Use the `docker-compose exec` to execute commands directly in a running
# container managed by Docker Compose. In this case, to create (if it doesn't
# exist) and access a new database lab08.db within the sqlite service.
$ docker-compose exec sqlite sqlite3 /database/lab08.db

sqlite> .database # Verify it's there
main: /database/lab08.db r/w
```

Or:

```bash
# Access the shell of the running container
$ docker exec -it cis395-sqlite-labs-sqlite-1 /bin/sh
# Create a new database inside the container
/ # sqlite3 /database/lab00.db

sqlite> .database # Verify it's there
main: /database/lab08.db r/w
```

### Interact with the lab08 database
```bash
$ docker-compose exec sqlite sqlite3 /database/lab08.db
```


## Preliminary Tasks

Execute the following SQL statements to create the Book table and insert four records into it.

```sql
CREATE TABLE Book (
bookNo VARCHAR(4),
title VARCHAR(50),
price DECIMAL,
PRIMARY KEY (bookNo)
);

INSERT INTO Book VALUES ('B001','Trigger Warning', 159.99);
INSERT INTO Book VALUES ('B002','Enemy Pie', 69.79);
INSERT INTO Book VALUES ('B003','The Last Enemy*****', 54.49);
INSERT INTO Book VALUES ('B004','***Endless Night******', 16.25);
```

```
sqlite> SELECT * FROM Book;
B001|Trigger Warning|159.99
B002|Enemy Pie|69.79
B003|The Last Enemy*****|54.49
B004|***Endless Night******|16.25
```

## Lab Tasks

### 1. Using the concatenation operator, write and execute the statement that displays the following sentences (as bookPrice) for books with prices higher than $20.

| bookPrice |
| --------- |
| The price of the book B001 is $159.99 |
| The price of the book B002 is $69.79 |
| The price of the book B003 is $54.49 |

```sql
SELECT 'The price of the book ' || bookNo || ' is $' || price AS bookPrice FROM Book WHERE price > 20;
```

### 2. Write and execute the statement that displays the following sentences (as titleLength) for books that have titles with a length less than 20 characters.

| titleLength |
| ----------- |
| The title of B001 has 15 characters |
| The title of B002 has 9 characters |
| The title of B003 has 19 characters |

```sql
SELECT 'The title of ' || bookNo || ' has ' || LENGTH(title) || ' characters' AS titleLength FROM Book WHERE LENGTH(title) < 20;
```

### 3. Similarly, type and execute the SQL statement that converts the lowercase letters of the title attribute to uppercase letters.

bookNo | title | newTitle
------ | ----- | --------
B001|Trigger Warning|TRIGGER WARNING
B002|Enemy Pie|ENEMY PIE
B003|The Last Enemy\*\*\*\*\*|THE LAST ENEMY\*\*\*\*\*
B004|\*\*\*Endless Night\*\*\*\*\*\*|\*\*\*ENDLESS NIGHT\*\*\*\*\*\*

```sql
SELECT bookNo, title, UPPER(title) AS newTitle FROM Book;
```

### 4. Similarly, type and execute the SQL statement that uses the LTRIM operator to only remove asterisks from the beginning of the title attribute. Note: The letter L in the operator LTRIM stands for Left (i.e., Left TRIM).

title | newTitle
----- | --------
Trigger Warning|Trigger Warning
Enemy Pie|Enemy Pie
The Last Enemy\*\*\*\*\*|The Last Enemy\*\*\*\*\*
\*\*\*Endless Night\*\*\*\*\*\*|Endless Night\*\*\*\*\*\*

```sql
SELECT title, LTRIM(title, '*') AS newTitle FROM Book;
```

### 5. Type and execute the SQL statement that uses the RTRIM operator to remove whitespaces at the end of the title attribute. Note: The letter R in the operator RTRIM stands for Right (i.e., Right TRIM).

title | newTitle
----- | --------
Trigger Warning|Trigger Warning
Enemy Pie|Enemy Pie
The Last Enemy\*\*\*\*\*|The Last Enemy
\*\*\*Endless Night\*\*\*\*\*\*|\*\*\*Endless Night


```sql
SELECT title, RTRIM(title, '*') AS newTitle FROM Book;
```

### 6. Update the Book table by removing asterisks from the beginning and the end of the title attribute.

title | newTitle
----- | --------
Trigger Warning|Trigger Warning
Enemy Pie|Enemy Pie
The Last Enemy\*\*\*\*\*|The Last Enemy
\*\*\*Endless Night\*\*\*\*\*\*|Endless Night

```sql
UPDATE Book SET title = LTRIM(RTRIM(title, '*'), '*');
```
