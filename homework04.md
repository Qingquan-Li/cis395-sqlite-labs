# Homework 04 - SQL Data Manipulation

## Table Airport

| airportID | name                          | city        | state | country |
|-----------|-------------------------------|-------------|-------|---------|
| CDG       | Charles de Gaulle             | Paris       | NULL  | FRA     |
| DXB       | Dubai International           | Dubai       | NULL  | UAE     |
| JFK       | John F Kennedy International  | New York    | NY    | USA     |
| LGA       | LaGuardia                     | New York    | NY    | USA     |
| MIA       | Miami International           | Miami       | FL    | USA     |
| SFO       | San Francisco International   | San Francisco | CA  | USA     |

## Table Carrier

| carrierID | name            | fleetSize | employees | revenue |
|-----------|-----------------|-----------|-----------|---------|
| AF        | Air France      | 225       | 84,602    | 15,414  |
| DL        | Delta Air Lines | 855       | 80,000    | 39,639  |
| EK        | Emirates Airline| 239       | 84,153    | 18,300  |
| US        | US Airways      | 338       | 31,467    | 13,050  |

## Table Flight

| carrierID | flightNo | date       | time  | airportID | destination | distance |
|-----------|----------|------------|-------|-----------|-------------|----------|
| DL        | 426      | 10/16/2017 | 7:00 AM | JFK       | SFO         | 2,586    |
| DL        | 426      | 10/17/2017 | 7:00 AM | JFK       | SFO         | 2,586    |
| DL        | 479      | 10/16/2017 | 7:25 PM | JFK       | SFO         | 2,586    |
| EK        | 721      | 10/17/2017 | 11:25 AM| CDG       | DXB         | 3,259    |
| US        | 783      | 10/17/2017 | 3:20 AM | DXB       | JFK         | 6,843    |
| DL        | 1472     | 10/17/2017 | 7:30 AM | LGA       | MIA         | 1,099    |
| AF        | 3577     | 10/17/2017 | 5:45 PM | JFK       | CDG         | 3,629    |
| US        | 3577     | 10/17/2017 | 9:40 AM | LGA       | SFO         | 2,576    |
| AF        | 3634     | 10/16/2017 | 1:20 PM | CDG       | MIA         | 4,580    |

---

## Create Tables

```sql
CREATE TABLE Airport (
airportID VARCHAR(3) PRIMARY KEY,
name VARCHAR(50) NOT NULL,
city VARCHAR(50) NOT NULL,
state VARCHAR(2),
country VARCHAR(3) NOT NULL
);
```

```sql
CREATE TABLE Carrier (
carrierID VARCHAR(2) PRIMARY KEY,
name VARCHAR(50) NOT NULL,
fleetSize INT NOT NULL,
employees INT NOT NULL,
revenue INT NOT NULL
);
```

```sql
CREATE TABLE Flight (
carrierID VARCHAR(2) NOT NULL,
flightNo INT NOT NULL,
date DATE NOT NULL,
time TIME NOT NULL,
airportID VARCHAR(3) NOT NULL,
destination VARCHAR(3) NOT NULL,
distance INT NOT NULL,
PRIMARY KEY (carrierID, flightNo, date),
FOREIGN KEY (carrierID) REFERENCES Carrier(carrierID),
FOREIGN KEY (airportID) REFERENCES Airport(airportID)
);
```

## Insert Data

```sql
INSERT INTO Airport VALUES
('CDG', 'Charles de Gaulle', 'Paris', NULL, 'FRA'),
('DXB', 'Dubai International', 'Dubai', NULL, 'UAE'),
('JFK', 'John F Kennedy International', 'New York', 'NY', 'USA'),
('LGA', 'LaGuardia', 'New York', 'NY', 'USA'),
('MIA', 'Miami International', 'Miami', 'FL', 'USA'),
('SFO', 'San Francisco International', 'San Francisco', 'CA', 'USA');
```

```sql
INSERT INTO Carrier VALUES
('AF', 'Air France', 225, 84602, 15414),
('DL', 'Delta Air Lines', 855, 80000, 39639),
('EK', 'Emirates Airline', 239, 84153, 18300),
('US', 'US Airways', 338, 31467, 13050);
```

```sql
INSERT INTO Flight VALUES
('DL', 426, '2017-10-16', '07:00:00', 'JFK', 'SFO', 2586),
('DL', 426, '2017-10-17', '07:00:00', 'JFK', 'SFO', 2586),
('DL', 479, '2017-10-16', '19:25:00', 'JFK', 'SFO', 2586),
('EK', 721, '2017-10-17', '11:25:00', 'CDG', 'DXB', 3259),
('US', 783, '2017-10-17', '03:20:00', 'DXB', 'JFK', 6843),
('DL', 1472, '2017-10-17', '07:30:00', 'LGA', 'MIA', 1099),
('AF', 3577, '2017-10-17', '17:45:00', 'JFK', 'CDG', 3629),
('US', 3577, '2017-10-17', '09:40:00', 'LGA', 'SFO', 2576),
('AF', 3634, '2017-10-16', '13:20:00', 'CDG', 'MIA', 4580);
```

---

## 1. List all airport names.

```sql
SELECT name FROM Airport;
```

## 2. List full details of all airports located in NY state.

```sql
SELECT * FROM Airport WHERE state = 'NY';
```

## 3. List the name and the state of all United States airports.

```sql
SELECT name, state FROM Airport WHERE country = 'USA';
```

## 4. List the name and the fleet size of all carriers employing more than 50000 workers.

```sql
SELECT name, fleetSize FROM Carrier WHERE employees > 50000;
```

## 5. List the number of flights, the earliest flight time, and the latest flight times in EACH day.

```sql
SELECT COUNT(*), MIN(time), MAX(time) FROM Flight GROUP BY date;
```

or:

```sql
SELECT date, COUNT(*), MIN(time), MAX(time) FROM Flight GROUP BY date;
```

## 6. List all flights leaving from United States airports.

```sql
SELECT * FROM Flight
WHERE airportID IN (SELECT airportID FROM Airport WHERE country = 'USA');
```

Using INNER JOIN:

```sql
SELECT f.carrierID, f.flightNo, f.date, f.time, f.airportID, f.destination, f.distance
FROM Flight f
INNER JOIN Airport a ON f.airportID = a.airportID
WHERE a.country = 'USA';
```

Note:
Don't use
`SELECT * FROM Flight JOIN Airport ON Flight.airportID = Airport.airportID WHERE country = 'USA';`
because it will return all columns from both tables.

## 7. List the carrier name, the carrierID, the flightNo, and the date of all flights.

```sql
SELECT c.name, f.carrierID, f.flightNo, f.date
FROM Carrier c
INNER JOIN Flight f ON c.carrierID = f.carrierID;
```

or:

```sql
SELECT c.name, f.carrierID, f.flightNo, f.date
FROM Carrier c, Flight f
WHERE c.carrierID = f.carrierID;
```

## 8. List the carriers that do not land at JFK.

```sql
SELECT * FROM Carrier       
WHERE carrierID NOT IN (SELECT carrierID FROM Flight WHERE destination = 'JFK');
```

Using INNER JOIN:

```sql
SELECT c.carrierID, c.name, c.fleetSize, c.employees, c.revenue
FROM Carrier c
INNER JOIN Flight f ON c.carrierID = f.carrierID
WHERE f.destination <> 'JFK';
```

## 9. List the carrierID and the distance of all flights leaving from NY state airports.

```sql
SELECT carrierID, distance
FROM Flight
WHERE airportID IN (SELECT airportID FROM Airport WHERE state = 'NY');
```

Using INNER JOIN:

```sql
SELECT f.carrierID, f.distance
FROM Flight f
INNER JOIN Airport a ON f.airportID = a.airportID
WHERE a.state = 'NY';
```

## 10. List the carrierID, the distance, and the destination airport name of all flights landing at California (CA) state airports.

```sql
SELECT f.carrierID, f.distance, a.name
FROM Flight f
INNER JOIN Airport a ON f.destination = a.airportID
WHERE a.state = 'CA';
```

~~`SELECT f.carrierID, f.distance, a.name FROM Flight f INNER JOIN Airport a ON f.airportID = a.airportID WHERE a.state = 'CA';`~~

## 11. Using a subquery, list the name and the fleetSize of carriers that have flights landing at United States airports.

```sql
SELECT name, fleetSize
FROM Carrier
WHERE carrierID
IN (SELECT carrierID FROM Flight WHERE destination IN (SELECT airportID FROM Airport WHERE country = 'USA'));
```

Note:
Using `IN` instead of `=` because the subquery returns multiple values.

## 12. Using a join, list the name and the fleetSize of carriers that have flights landing at United States airports. Include the cities of the destination airports in the result.

```sql
SELECT c.name, c.fleetSize, a.city
FROM Carrier c
INNER JOIN Flight f ON c.carrierID = f.carrierID
INNER JOIN Airport a ON f.destination = a.airportID
WHERE a.country = 'USA'
GROUP BY c.name;
```

## 13. US Airways has added 25 new planes to its fleet. Write the SQL UPDATE statement that reflects this change.

```sql
UPDATE Carrier
SET fleetSize = fleetSize + 25
name = 'US Airways';
```

## 14. For unforeseen reasons, the flight DL 426 on 10/17/2017 that is supposed to leave from JFK is now scheduled to depart from LGA. Write the SQL UPDATE statement that reflects this change. Note: The distance of the flight needs to be updated as well. The distance between LGA and SFO is 2576.

```sql
UPDATE Flight
SET airportID = 'LGA', distance = 2576
WHERE carrierID = 'DL' AND flightNo = 426 AND date = '10/17/2017';
```

## 15. Due to adverse weather conditions on 10/17/2017, all flights that are scheduled to depart from NY airports are canceled. DELETE these flights from the Flight table.

```sql
DELETE FROM Flight
WHERE airportID IN (SELECT airportID FROM Airport WHERE state = 'NY')
AND date = '10/17/2017';
```

~~`DELETE Flight WHERE date = '10/17/2017';`~~

~~`DELETE FROM Flight WHERE airportID = (SELECT airportID FROM Airport WHERE state = 'NY') AND date = '10/17/2017';`~~

Note:
Using `IN` instead of `=` because the subquery returns multiple values.

## 16. (Bonus Task) For domestic flights within the United States, display the name of the carrier, the city of departure, the city of arrival, and the distance of the flight.

```sql
SELECT c.name, ad.city, aa.city, f.distance
FROM Carrier c, Airport ad, Airport aa, Flight f
WHERE c.carrierID = f.carrierID
AND f.airportID = ad.airportID
AND f.destination = aa.airportID
AND ad.country = 'USA'
AND aa.country = 'USA';
```

or:

```sql
SELECT c.name, a1.city, a2.city, f.distance
FROM Carrier c
INNER JOIN Flight f ON c.carrierID = f.carrierID
INNER JOIN Airport a1 ON f.airportID = a1.airportID
INNER JOIN Airport a2 ON f.destination = a2.airportID
WHERE a1.country = 'USA' AND a2.country = 'USA';
```
