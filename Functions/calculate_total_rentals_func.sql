-- function for calculating total number of rented properties by a specific host
CREATE FUNCTION Calculate_Total_Rentals
    (@host_id INT)  
RETURNS INT
AS
BEGIN
    DECLARE @total_rentals INT;
    SELECT @total_rentals = COUNT(b.booking_id)
    FROM Bookings b
    JOIN Properties p ON b.property_id = p.property_id
    WHERE p.host_id = @host_id;
    RETURN @total_rentals;
END;
