# Lab 07 - SQL Data Manipulation

## Create a new database (lab07) inside the Docker container

```bash
# Use the `docker-compose exec` to execute commands directly in a running
# container managed by Docker Compose. In this case, to create (if it doesn't
# exist) and access a new database lab07.db within the sqlite service.
$ docker-compose exec sqlite sqlite3 /database/lab07.db

sqlite> .database # Verify it's there
main: /database/lab07.db r/w
```

Or:

```bash
# Access the shell of the running container
$ docker exec -it cis395-sqlite-labs-sqlite-1 /bin/sh
# Create a new database inside the container
/ # sqlite3 /database/lab07.db

sqlite> .database # Verify it's there
main: /database/lab07.db r/w
```

### Interact with the lab07 database
```bash
$ docker-compose exec sqlite sqlite3 /database/lab07.db
```


## Preliminary Tasks

Execute the following SQL statements to create the following tables and insert sample data into them.
- Airport 	(airportID, name, city, state, country)
- Carrier 	(carrierID, name, fleetSize, employees, revenue)
- Flight 	(flightNo, carrierID, airportID, destination, distance)
- Passenger (passengerID, name, age, email)
- Booking 	(passengerID, flightNo, day, time)

```sql
CREATE TABLE Airport (
airportID VARCHAR(3),
name VARCHAR(30),
city VARCHAR(20),
state VARCHAR(2),
country VARCHAR(3),
PRIMARY KEY (airportID));

CREATE TABLE Carrier (
carrierID VARCHAR(2),
name VARCHAR(20),
fleetSize INTEGER,
employees INTEGER,
revenue INTEGER,
PRIMARY KEY (carrierID));

CREATE TABLE Flight (
flightNo VARCHAR(6),
carrierID VARCHAR(2),
airportID VARCHAR(3),
destination VARCHAR(3),
distance INTEGER,
PRIMARY KEY (flightNo));

CREATE TABLE Passenger (
passengerID VARCHAR(4),
name VARCHAR(30),
age INTEGER,
email VARCHAR(30),
PRIMARY KEY (passengerID));

CREATE TABLE Booking (
passengerID VARCHAR(4),
flightNo VARCHAR(6),
day VARCHAR(10),
time VARCHAR(8),
PRIMARY KEY (passengerID,flightNo,day));


INSERT INTO Airport VALUES('CDG','Charles de Gaulle','Paris',NULL,'FRA');
INSERT INTO Airport VALUES('DXB','Dubai International','Dubai',NULL,'UAE');
INSERT INTO Airport VALUES('JFK','John F Kennedy International','New York','NY','USA');
INSERT INTO Airport VALUES('LGA','LaGuardia','New York','NY','USA');
INSERT INTO Airport VALUES('MIA','Miami International','Miami','FL','USA');
INSERT INTO Airport VALUES('SFO','San Francisco International','San Francisco','CA','USA');


INSERT INTO Carrier VALUES('AF','Air France',225,84600,15500);
INSERT INTO Carrier VALUES('DL','Delta Airlines',860,80000,40000);
INSERT INTO Carrier VALUES('EK','Emirates Airline',240,84150,18300);
INSERT INTO Carrier VALUES('US','US Airways',340,31500,13000);


INSERT INTO Flight VALUES('DL426','DL','JFK','SFO',2586);
INSERT INTO Flight VALUES('DL479','DL','JFK','SFO',2586);
INSERT INTO Flight VALUES('EK721','EK','CDG','DXB',3259);
INSERT INTO Flight VALUES('US783','US','DXB','JFK',6843);
INSERT INTO Flight VALUES('DL1472','DL','LGA','MIA',1099);
INSERT INTO Flight VALUES('AF3577','AF','JFK','CDG',3629);
INSERT INTO Flight VALUES('US3577','US','LGA','SFO',2576);
INSERT INTO Flight VALUES('AF3634','AF','CDG','MIA',4580);
INSERT INTO Flight VALUES('DL613','DL','SFO','LGA',2576);


INSERT INTO Passenger VALUES('P201','Kewon Song','36','ksong@gmail.com');
INSERT INTO Passenger VALUES('P202','Frank Mancione','14','fmancione@hotmail.com');
INSERT INTO Passenger VALUES('P203','Angela Peterkin','66','angela@gmail.com');
INSERT INTO Passenger VALUES('P204','Stephanie Johnson','16','sjohnson@gmail.com');
INSERT INTO Passenger VALUES('P205','Rafael Bah','17','rbah@yahoo.com');
INSERT INTO Passenger VALUES('P206','Leisa Aras','49','leisa_aras@gmail.com');
INSERT INTO Passenger VALUES('P207','Robert Salsberry','55','rsalsberry@hotmail.com');
INSERT INTO Passenger VALUES('P208','Alfina Chanti','24','alfina@aol.com');
INSERT INTO Passenger VALUES('P209','Connie Profaci','32','cprofaci@juno.com');
INSERT INTO Passenger VALUES('P210','Steven Plac','17','steven@yahoo.com');
INSERT INTO Passenger VALUES('P211','Cindy Lyon','18','cindy.lyon@hotmail.com');
INSERT INTO Passenger VALUES('P212','Nicole Gary','26','ngary@gmail.com');


INSERT INTO Booking VALUES('P201','DL426','10/10/2021','7:00 AM');
INSERT INTO Booking VALUES('P201','DL426','10/17/2021','7:00 AM');
INSERT INTO Booking VALUES('P201','DL426','10/24/2021','7:00 AM');
INSERT INTO Booking VALUES('P202','DL426','10/17/2021','7:00 AM');
INSERT INTO Booking VALUES('P202','DL426','10/24/2021','7:00 AM');
INSERT INTO Booking VALUES('P203','DL479','10/17/2021','7:25 PM');
INSERT INTO Booking VALUES('P204','EK721','10/17/2021','11:25 AM');
INSERT INTO Booking VALUES('P204','EK721','10/24/2021','11:25 AM');
INSERT INTO Booking VALUES('P205','US783','10/03/2021','3:20 AM');
INSERT INTO Booking VALUES('P205','US783','10/10/2021','3:20 AM');
INSERT INTO Booking VALUES('P205','US783','10/17/2021','3:20 AM');
INSERT INTO Booking VALUES('P205','US783','10/24/2021','3:20 AM');
INSERT INTO Booking VALUES('P206','DL1472','10/17/2021','7:30 AM');
INSERT INTO Booking VALUES('P207','AF3577','10/17/2021','5:45 PM');
INSERT INTO Booking VALUES('P208','US3577','10/10/2021','9:40 AM');
INSERT INTO Booking VALUES('P208','US3577','10/17/2021','9:40 AM');
INSERT INTO Booking VALUES('P208','US3577','10/24/2021','9:40 AM');
INSERT INTO Booking VALUES('P209','AF3634','10/17/2021','1:20 PM');
INSERT INTO Booking VALUES('P210','AF3577','10/17/2021','5:45 PM');
INSERT INTO Booking VALUES('P211','AF3577','10/17/2021','5:45 PM');
INSERT INTO Booking VALUES('P212','AF3577','10/17/2021','5:45 PM');
```


## Lab Tasks

### 1. List full details of all United States airports.

```sql
SELECT * FROM Airport WHERE country = 'USA';
``` 

### 2. List the name, the city, and the country of all airports located outside of the United States.

```sql
SELECT name, city, country FROM Airport WHERE country != 'USA';
```

### 3. List the name, the fleet size, and the revenue of all carriers with revenue lower than 20000.

```sql
SELECT name, fleetSize, revenue FROM Carrier WHERE revenue < 20000;
```

### 4. Display the number, the lowest age, and the highest age of all passengers; rename the fields using pCount, minAge, and maxAge, respectively.

```sql
SELECT COUNT(passengerID) AS pCount, MIN(age) AS minAge, MAX(age) AS maxAge FROM Passenger;
```

### 5. Display the number and the average revenue of all carriers employing more than 50000 workers; rename the fields using cCount and avgRevenue, respectively.

```sql
SELECT COUNT(carrierID) AS cCount, AVG(revenue) AS avgRevenue FROM Carrier WHERE employees > 50000;
```

### 6. Display the number of airports (as aCount) in each country.

```sql
SELECT country, COUNT(airportID) AS aCount FROM Airport GROUP BY country;
```

### 7. Display the number of bookings (as bCount) for each (passengerID, flightNo) combination. Only display counts that are greater than 1. Note: Each count you are displaying in this task represents the number of times a passenger is booking the same flightNo (on different dates).

```sql
SELECT passengerID, flightNo, COUNT(*) AS bCount FROM Booking GROUP BY passengerID, flightNo HAVING COUNT(*) > 1;
```

### 8. List all flights leaving from United States airports.

```sql
SELECT * FROM Flight WHERE airportID IN (SELECT airportID FROM Airport WHERE country = 'USA');
```

### 9. List the flightNo, the destination, and the distance of flights landing at New York state airports.

```sql
SELECT flightNo, destination, distance
FROM Flight
WHERE destination IN (SELECT airportID FROM Airport WHERE state = 'NY');
```

### 10. List full details of the carriers that do not leave from JFK.

```sql
SELECT * FROM Carrier WHERE carrierID NOT IN (SELECT carrierID FROM Flight WHERE airportID = 'JFK');
```

### 11. List the carrierID and the name of carriers that have flights landing at France airports.

```sql
SELECT carrierID, name FROM Carrier WHERE carrierID
IN (SELECT carrierID FROM Flight WHERE destination IN (SELECT airportID FROM Airport WHERE country = 'FRA'));
```

### 12. List the names of passengers who booked flights that are scheduled on October 24th 2021, along with the flightNo, and the time of the flights.

```sql
SELECT name, flightNo, time FROM Passenger, Booking
WHERE Passenger.passengerID = Booking.passengerID AND day = '10/24/2021';
```

Or:

```sql
SELECT name, flightNo, time FROM Passenger p
INNER JOIN Booking b ON p.passengerID = b.passengerID
WHERE day = '10/24/2021';
```

### 13. List the names of passengers who booked flights that are scheduled on October 24th 2021, along with the flightNo, the time, and the distance of the flights.

```sql
SELECT name, flightNo, time, distance FROM Passenger, Booking, Flight
WHERE Passenger.passengerID = Booking.passengerID AND Booking.flightNo = Flight.flightNo AND day = '10/24/2021';
```

Output:
```
Parse error: ambiguous column name: flightNo
  SELECT name, flightNo, time, distance FROM Passenger, Booking, Flight WHERE Pa
               ^--- error here
```

Because `flightNo` is in both `Booking` and `Flight` tables, we need to specify which one we want to use:
```sql
SELECT name, Booking.flightNo, time, distance FROM Passenger, Booking, Flight
WHERE Passenger.passengerID = Booking.passengerID AND Booking.flightNo = Flight.flightNo AND day = '10/24/2021';
```

Or using JOIN:

```sql
SELECT name, b.flightNo, time, distance FROM Passenger p
INNER JOIN Booking b ON p.passengerID = b.passengerID
INNER JOIN Flight f ON b.flightNo = f.flightNo
WHERE day = '10/24/2021';
```

### 14. List the names of passengers who booked flights that are scheduled on October 24th 2021, along with the flightNo, the time, the distance, and the carrier name of the flights.

```sql
SELECT p.name, b.flightNo, time, distance, c.name
FROM Passenger p, Booking b, Flight f, Carrier c
WHERE p.passengerID = b.passengerID
AND b.flightNo = f.flightNo
AND f.carrierID = c.carrierID
AND day = '10/24/2021';
```

Or:

```sql
SELECT p.name, b.flightNo, time, distance, c.name
FROM Booking b
INNER JOIN Passenger p ON p.passengerID = b.passengerID
INNER JOIN Flight f ON b.flightNo = f.flightNo
INNER JOIN Carrier c ON f.carrierID = c.carrierID
WHERE day = '10/24/2021';
```

### 15. List the names of passengers who booked flights that are scheduled on October 24th 2021, along with the flightNo, the time, the distance, the carrier name of the flights, and the city of the departure airport (as departureCity).

```sql
SELECT p.name, b.flightNo, time, distance, c.name, a.city AS departureCity
FROM Booking b
INNER JOIN Passenger p ON p.passengerID = b.passengerID
INNER JOIN Flight f ON b.flightNo = f.flightNo
INNER JOIN Carrier c ON f.carrierID = c.carrierID
INNER JOIN Airport a ON f.airportID = a.airportID
WHERE day = '10/24/2021';
```

### 16. List the names of passengers who booked flights that are scheduled on October 24th 2021, along with the flightNo, the time, the distance, the carrier name of the flights, the city of the departure airport (as departureCity), and the city of the arrival airport (as arrivalCity).

```sql
SELECT p.name, b.flightNo, time, distance, c.name, a.city AS departureCity, a2.city AS arrivalCity
FROM Booking b
INNER JOIN Passenger p ON p.passengerID = b.passengerID
INNER JOIN Flight f ON b.flightNo = f.flightNo
INNER JOIN Carrier c ON f.carrierID = c.carrierID
INNER JOIN Airport a ON f.airportID = a.airportID
INNER JOIN Airport a2 ON f.destination = a2.airportID
WHERE day = '10/24/2021';
```

### 17. Display the name, the age, the flightNo, and the number (as bCount) of times a minor passenger is booking the same flight more than once. Note: The age of a minor is less than 18 years.

```sql
SELECT p.name, p.age, b.flightNo, COUNT(*) AS bCount
FROM Booking b
INNER JOIN Passenger p ON p.passengerID = b.passengerID
WHERE p.age < 18
GROUP BY p.name, p.age, b.flightNo
HAVING COUNT(*) > 1;
```
