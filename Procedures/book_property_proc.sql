-- procedure for booking a property
CREATE PROCEDURE Book_Property
    @user_id INT,
    @property_id INT,
    @host_id INT,
    @booking_date DATE,
    @check_in_date DATE,
    @check_out_date DATE,
    @num_guests INT,
    @price_per_night DECIMAL
AS
BEGIN
    if (select DATEDIFF(YEAR, @birth_date, GETDATE())) < 18
    print 'To book a property you must be at least 18 years old';
    else if (select [availability] from Properties where property_id = @property_id) = 0
    print 'Property is not available for booking';
    else if (select max_guests from Properties where property_id = @property_id) < @num_guests
    print 'Number of guests exceeds the maximum capacity of the property';
    INSERT INTO Bookings (user_id, property_id, host_id, booking_date, check_in_date, check_out_date, num_guests, total_cost)
    VALUES (@user_id, @property_id, @host_id, @booking_date, @check_in_date, @check_out_date, @num_guests, dbo.calculate_cost(@price_per_night, @check_in_date, @check_out_date));
    print 'Property booked successfully';
END;

EXEC Book_Property 1, 1, 1, '2021-01-01', '2021-01-10', '2021-01-20', 4, 200;

SELECT * FROM Bookings;
