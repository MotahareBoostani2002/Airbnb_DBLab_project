-- view for displaying user bookings
CREATE VIEW User_Bookings AS
SELECT b.booking_id, u.user_name, p.property_id, p.property_type, p.categories, b.booking_date, b.check_in_date, b.check_out_date, b.num_guests, b.total_cost
FROM Bookings b
JOIN Users u ON b.user_id = u.user_id
JOIN Properties p ON b.property_id = p.property_id;