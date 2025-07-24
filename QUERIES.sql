/*List all flights from ‘Delhi’ to ‘Mumbai’.
Find all flights scheduled on '2025-08-05'.
List flights departing after 10:00 AM.
Find all flights where status is 'Scheduled'.
Display the number of flights between each origin and destination.*/

USE AIRLINE;
SELECT * FROM flights 
WHERE ORIGIN = 'DELHI' AND destination = 'MUMBAI';

SELECT * FROM FLIGHTS
WHERE DATE(DEPARTURE_TIME) = '2025-08-05';

SELECT * FROM FLIGHTS
WHERE TIME(DEPARTURE_TIME) > '10:00:00';

SELECT * FROM FLIGHTS 
WHERE STATUS = 'SCHEDULED';

SELECT COUNT(*) AS FLIGHT_COUNT
FROM FLIGHTS
group by ORIGIN,DESTINATION;

-- Get all bookings made by a customer named 'Riya Sen'.
-- List customers who booked flights to 'Kolkata'.
-- Find the total number of bookings made by each customer.
-- Display customer details who have booked flights on or after '2025-08-01'.
-- List customers who haven't made any bookings.

SELECT B1.*
FROM BOOKINGS B1,CUSTOMERS C1
WHERE B1.CUSTOMER_ID = C1.CUSTOMER_ID AND C1.FULL_NAME = 'Riya Sen';

SELECT DISTINCT c.* FROM Customers c
JOIN Bookings b ON c.customer_id = b.customer_id
JOIN Flights f ON b.flight_id = f.flight_id
WHERE f.destination = 'Kolkata';

SELECT C1.FULL_NAME,COUNT(*)
FROM CUSTOMERS C1,BOOKINGS B1
WHERE C1.CUSTOMER_ID = B1.CUSTOMER_ID 
GROUP BY C1.CUSTOMER_ID;

SELECT C1.*
FROM CUSTOMERS C1,BOOKINGS B1
WHERE C1.CUSTOMER_ID = B1.CUSTOMER_ID AND B1.BOOKING_DATE >= '2025-08-01';

SELECT * 
FROM Customers c LEFT JOIN Bookings b 
ON c.customer_id = b.customer_id
WHERE b.booking_id IS NULL;

-- Find all available seats (not booked) for flight ID = 1.
-- Count the number of available seats for each flight.
-- List all seat numbers that are already booked for flight ID = 3.
-- Find total seat occupancy (booked vs available) per flight.
-- Show flights that are fully booked (no available seats).

SELECT *
FROM SEATS 
WHERE FLIGHT_ID = 1 AND is_booked = 'AVAILABLE';

SELECT COUNT(*)
FROM SEATS S1,FLIGHTS F1
WHERE S1.FLIGHT_ID = F1.FLIGHT_ID AND S1.IS_BOOKED = 'AVAILABLE'
GROUP BY F1.FLIGHT_ID;

SELECT SEAT_NUMBER
FROM SEATS
WHERE FLIGHT_ID = 3;

SELECT flight_id,
  SUM(CASE WHEN IS_BOOKED = 'Booked' THEN 1 ELSE 0 END) AS booked,
  SUM(CASE WHEN IS_BOOKED = 'Available' THEN 1 ELSE 0 END) AS available
FROM Seats
GROUP BY flight_id;

SELECT flight_id
FROM Seats
GROUP BY flight_id
HAVING SUM(CASE WHEN IS_BOOKED = 'Available' THEN 1 ELSE 0 END) = 0;

-- Get a booking summary per flight (total bookings).
-- List all bookings with flight route and booking date.
-- Find all bookings with status = 'Cancelled'.
-- Display top 3 flights with the highest number of bookings.
-- Show average number of bookings per customer.

SELECT flight_id, COUNT(*) AS total_bookings
FROM Bookings
GROUP BY flight_id;

SELECT b.booking_id, c.FULL_NAME, f.origin, f.destination, b.booking_date
FROM Bookings b
JOIN Customers c ON b.customer_id = c.customer_id
JOIN Flights f ON b.flight_id = f.flight_id;

SELECT * FROM Bookings
WHERE status = 'Cancelled';

SELECT flight_id, COUNT(*) AS total_bookings
FROM Bookings
GROUP BY flight_id
ORDER BY total_bookings DESC
LIMIT 3;

SELECT AVG(booking_count) AS avg_bookings_per_customer
FROM (
  SELECT customer_id, COUNT(*) AS booking_count
  FROM Bookings
  GROUP BY customer_id
) AS sub;

