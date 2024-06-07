-- procedure for canceling a booking 
CREATE PROCEDURE Cancel_Booking
    @booking_id INT
AS
BEGIN
	DELETE FROM Payments
    WHERE booking_id = @booking_id;
    DELETE FROM Bookings
    WHERE booking_id = @booking_id;
    print 'Booking canceled successfully';
END;

SELECT * FROM Bookings;
SELECT * FROM Payments;

EXEC Cancel_Booking 1;

SELECT * FROM Bookings;
SELECT * FROM Payments;