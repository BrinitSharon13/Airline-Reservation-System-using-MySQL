use airline;
CREATE TABLE Flights (
  flight_id INT AUTO_INCREMENT PRIMARY KEY,
  flight_number VARCHAR(10) NOT NULL UNIQUE,
  origin VARCHAR(50) NOT NULL,
  destination VARCHAR(50) NOT NULL,
  departure_time DATETIME NOT NULL,
  arrival_time DATETIME NOT NULL,
  status ENUM('Scheduled','Boarding','Departed','Arrived','Cancelled') 
         DEFAULT 'Scheduled',
  CHECK (origin <> destination)
) ENGINE=InnoDB;

CREATE TABLE Customers (
  customer_id INT AUTO_INCREMENT PRIMARY KEY,
  full_name VARCHAR(100) NOT NULL,
  email VARCHAR(100) UNIQUE,
  phone VARCHAR(20)
) ENGINE=InnoDB;

CREATE TABLE Seats (
  seat_id INT AUTO_INCREMENT PRIMARY KEY,
  flight_id INT NOT NULL,
  seat_number VARCHAR(5) NOT NULL,
  is_booked BOOLEAN DEFAULT FALSE,
  CONSTRAINT fk_seat_flight
    FOREIGN KEY (flight_id) REFERENCES Flights(flight_id)
      ON UPDATE CASCADE ON DELETE CASCADE,
  UNIQUE (flight_id, seat_number)
) ENGINE=InnoDB;

CREATE TABLE Bookings (
  booking_id INT PRIMARY KEY,
  flight_id INT,
  customer_id INT,
  booking_date DATETIME DEFAULT CURRENT_TIMESTAMP,
  status VARCHAR(20) DEFAULT 'Confirmed',
  FOREIGN KEY (flight_id) REFERENCES Flights(flight_id),
  FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);


INSERT INTO Flights (flight_id,flight_number, origin, destination, departure_time, arrival_time, status)
VALUES
(1,'AI101','Delhi', 'Mumbai', '2025-08-01 08:00:00', '2025-08-01 10:00:00', 'Scheduled'),
(2,'AI102', 'Chennai', 'Delhi', '2025-08-01 12:00:00', '2025-08-01 14:30:00', 'Scheduled'),
(3,'AI103', 'Bangalore', 'Kolkata', '2025-08-02 09:00:00', '2025-08-02 11:00:00', 'Scheduled'),
(4,'AI104', 'Hyderabad', 'Mumbai', '2025-08-02 16:00:00', '2025-08-02 18:00:00', 'Scheduled'),
(5,'AI105', 'Pune', 'Chennai', '2025-08-03 07:00:00', '2025-08-03 09:00:00', 'Scheduled'),
(6,'AI106', 'Kolkata', 'Delhi', '2025-08-03 10:00:00', '2025-08-03 12:00:00', 'Scheduled'),
(7,'AI107', 'Delhi', 'Bangalore', '2025-08-04 08:00:00', '2025-08-04 10:30:00', 'Scheduled'),
(8,'AI108', 'Mumbai', 'Chennai', '2025-08-04 11:00:00', '2025-08-04 13:00:00', 'Scheduled'),
(9,'AI109', 'Bangalore', 'Hyderabad', '2025-08-05 06:30:00', '2025-08-05 08:00:00', 'Scheduled'),
(10,'AI110', 'Chennai', 'Kolkata', '2025-08-05 14:00:00', '2025-08-05 16:30:00', 'Scheduled'),
(11,'AI111', 'Hyderabad', 'Delhi', '2025-08-06 15:00:00', '2025-08-06 17:00:00', 'Scheduled'),
(12,'AI112', 'Mumbai', 'Bangalore', '2025-08-06 17:30:00', '2025-08-06 19:00:00', 'Scheduled'),
(13,'AI113', 'Pune', 'Kolkata', '2025-08-07 09:00:00', '2025-08-07 11:00:00', 'Scheduled'),
(14,'AI114', 'Delhi', 'Pune', '2025-08-07 06:00:00', '2025-08-07 08:00:00', 'Scheduled'),
(15, 'AI115','Bangalore', 'Chennai', '2025-08-08 10:00:00', '2025-08-08 12:00:00', 'Scheduled'),
(16,'AI116', 'Chennai', 'Hyderabad', '2025-08-08 14:00:00', '2025-08-08 16:00:00', 'Scheduled'),
(17,'AI117', 'Mumbai', 'Delhi', '2025-08-09 07:00:00', '2025-08-09 09:00:00', 'Scheduled'),
(18,'AI118', 'Kolkata', 'Hyderabad', '2025-08-09 13:00:00', '2025-08-09 15:00:00', 'Scheduled'),
(19,'AI119', 'Delhi', 'Chennai', '2025-08-10 11:00:00', '2025-08-10 13:30:00', 'Scheduled'),
(20,'AI120', 'Hyderabad', 'Pune', '2025-08-10 18:00:00', '2025-08-10 20:00:00', 'Scheduled');

INSERT INTO Customers (customer_id, full_name, email, phone)
VALUES
(1, 'Aarav Sharma', 'aarav@example.com', '9876543210'),
(2, 'Isha Patel', 'isha@example.com', '9876543211'),
(3, 'Rohan Mehta', 'rohan@example.com', '9876543212'),
(4, 'Ananya Rao', 'ananya@example.com', '9876543213'),
(5, 'Kabir Joshi', 'kabir@example.com', '9876543214'),
(6, 'Meera Kapoor', 'meera@example.com', '9876543215'),
(7, 'Aditya Verma', 'aditya@example.com', '9876543216'),
(8, 'Sara Nair', 'sara@example.com', '9876543217'),
(9, 'Yash Singh', 'yash@example.com', '9876543218'),
(10, 'Tanya Jain', 'tanya@example.com', '9876543219'),
(11, 'Riya Sen', 'riya@example.com', '9876543220'),
(12, 'Karan Malhotra', 'karan@example.com', '9876543221'),
(13, 'Nikita Das', 'nikita@example.com', '9876543222'),
(14, 'Arjun Desai', 'arjun@example.com', '9876543223'),
(15, 'Priya Agarwal', 'priya@example.com', '9876543224'),
(16, 'Rahul Sinha', 'rahul@example.com', '9876543225'),
(17, 'Sneha Kulkarni', 'sneha@example.com', '9876543226'),
(18, 'Vikram Bhatt', 'vikram@example.com', '9876543227'),
(19, 'Neha Reddy', 'neha@example.com', '9876543228'),
(20, 'Siddharth Yadav', 'siddharth@example.com', '9876543229');

INSERT INTO Seats (seat_id, flight_id, seat_number, is_booked)
VALUES
(1, 1, '1A', FALSE),
(2, 1, '1B', FALSE),
(3, 1, '1C', FALSE),
(4, 1, '1D', FALSE),
(5, 1, '2A', FALSE),
(6, 1, '2B', FALSE),
(7, 1, '2C', FALSE),
(8, 1, '2D', FALSE),
(9, 1, '3A', FALSE),
(10, 1, '3B', FALSE),
(11, 1, '3C', FALSE),
(12, 1, '3D', FALSE),
(13, 1, '4A', FALSE),
(14, 1, '4B', FALSE),
(15, 1, '4C', FALSE),
(16, 1, '4D', FALSE),
(17, 1, '5A', FALSE),
(18, 1, '5B', FALSE),
(19, 1, '5C', FALSE),
(20, 1, '5D', FALSE);

INSERT INTO Bookings (booking_id, flight_id, customer_id, booking_date, status)
VALUES
(1, 1, 1, '2025-07-10', 'Confirmed'),
(2, 2, 2, '2025-07-11', 'Confirmed'),
(3, 3, 3, '2025-07-12', 'Confirmed'),
(4, 4, 4, '2025-07-13', 'Confirmed'),
(5, 5, 5, '2025-07-14', 'Confirmed'),
(6, 6, 6, '2025-07-15', 'Confirmed'),
(7, 7, 7, '2025-07-16', 'Confirmed'),
(8, 8, 8, '2025-07-17', 'Confirmed'),
(9, 9, 9, '2025-07-18', 'Confirmed'),
(10, 10, 10, '2025-07-19', 'Confirmed'),
(11, 11, 11, '2025-07-20', 'Confirmed'),
(12, 12, 12, '2025-07-21', 'Confirmed'),
(13, 13, 13, '2025-07-22', 'Confirmed'),
(14, 14, 14, '2025-07-23', 'Confirmed'),
(15, 15, 15, '2025-07-24', 'Confirmed'),
(16, 16, 16, '2025-07-25', 'Confirmed'),
(17, 17, 17, '2025-07-26', 'Confirmed'),
(18, 18, 18, '2025-07-27', 'Confirmed'),
(19, 19, 19, '2025-07-28', 'Confirmed'),
(20, 20, 20, '2025-07-29', 'Confirmed');



