ALTER TABLE Bookings ADD COLUMN seat_id INT;
DELIMITER //

CREATE TRIGGER update_seat_after_booking
AFTER INSERT ON Bookings
FOR EACH ROW
BEGIN
  UPDATE Seats
  SET status = 'Booked'
  WHERE seat_id = NEW.seat_id AND flight_id = NEW.flight_id;
END;
//

DELIMITER ;

DELIMITER //
CREATE TRIGGER update_seat_after_cancel
AFTER UPDATE ON Bookings
FOR EACH ROW
BEGIN
  IF NEW.status = 'Cancelled' THEN
    UPDATE Seats
    SET status = 'Available'
    WHERE seat_id = NEW.seat_id AND flight_id = NEW.flight_id;
  END IF;
END;
DELIMITER ;


