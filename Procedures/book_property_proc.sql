-- procedure for booking a property
CREATE PROCEDURE Book_Property
    @user_id INT,
    @property_id INT,
    @host_id INT,
    @booking_date DATE,
    @check_in_date DATE,
    @check_out_date DATE,
    @num_guests INT
AS
BEGIN
    INSERT INTO Bookings (user_id, property_id, host_id, booking_date, check_in_date, check_out_date, num_guests, total_cost)
    VALUES (@user_id, @property_id, @host_id, @booking_date, @check_in_date, @check_out_date, @num_guests, calculate_cost(@price_per_night, @check_in_date, @check_out_date));
    print 'Property booked successfully';
END;