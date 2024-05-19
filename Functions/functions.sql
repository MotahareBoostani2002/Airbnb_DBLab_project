-- function for calculating total cost of rented properties by a specific host
CREATE FUNCTION Calculate_Total_Cost
    (@host_id INT)
RETURNS DECIMAL(10)
AS
BEGIN
    DECLARE @total_cost DECIMAL(10);
    SELECT @total_cost = SUM(b.total_cost)
    FROM Bookings b
    JOIN Properties p ON b.property_id = p.property_id
    WHERE p.host_id = @host_id;
    RETURN @total_cost;
END;


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

FUNCTION calculate_cost (@price_per_night DECIMAL(4), @check_in_date DATE, @check_out_date DATE)
RETURNS DECIMAL(10)
AS
BEGIN
    DECLARE @total_days INT;
    SET @total_days = DATEDIFF(day, @check_in_date, @check_out_date);
    RETURN @price_per_night * @total_days;
END;
