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

SELECT * FROM Bookings;

SELECT dbo.Calculate_Total_Cost(1) AS 'Total Cost for Host 1';