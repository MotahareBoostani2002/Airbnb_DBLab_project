-- trigger to update availability of property after booking
CREATE TRIGGER Update_Availability
ON Bookings
AFTER INSERT
AS
BEGIN
    UPDATE Properties
    SET availability = 0
    WHERE property_id IN (SELECT property_id FROM inserted);
END;