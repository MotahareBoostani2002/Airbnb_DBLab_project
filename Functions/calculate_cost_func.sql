CREATE FUNCTION calculate_cost 
(@price_per_night DECIMAL(4), @check_in_date DATE, @check_out_date DATE)
RETURNS DECIMAL(10)
AS
BEGIN
    DECLARE @total_days INT;
    SET @total_days = DATEDIFF(day, @check_in_date, @check_out_date);
    RETURN @price_per_night * @total_days;
END;
