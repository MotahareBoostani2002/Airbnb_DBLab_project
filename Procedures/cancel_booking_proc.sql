-- procedure for canceling a booking 
CREATE PROCEDURE Cancel_Booking
    @booking_id INT
AS
BEGIN
    DELETE FROM Bookings
    WHERE booking_id = @booking_id;
    print 'Booking canceled successfully';
END;

EXEC Cancel_Booking 1;
