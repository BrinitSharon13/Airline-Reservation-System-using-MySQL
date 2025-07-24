CREATE VIEW Available_Seats AS
SELECT * FROM Seats
WHERE Is_booked = 'Available';


CREATE VIEW Booking_Summary AS
SELECT 
    b.booking_id,
    c.full_name AS customer_name,
    f.origin,
    f.destination,
    f.departure_time,
    b.status
FROM Bookings b
JOIN Customers c ON b.customer_id = c.customer_id
JOIN Flights f ON b.flight_id = f.flight_id;
