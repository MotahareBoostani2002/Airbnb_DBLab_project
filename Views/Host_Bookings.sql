-- view for displaying host bookings

CREATE VIEW Host_Bookings AS
SELECT b.booking_id, h.host_name, p.property_id, p.property_type, p.categories, b.booking_date, b.check_in_date, b.check_out_date, b.num_guests, b.total_cost
FROM Bookings b
JOIN Hosts h ON b.host_id = h.host_id
JOIN Properties p ON b.property_id = p.property_id;