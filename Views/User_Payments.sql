-- view for displaying user payments
CREATE VIEW User_Payments AS
SELECT u.user_name, b.booking_id, p.payment_date, p.payment_amount, p.payment_method
FROM Payments p
JOIN Bookings b ON p.booking_id = b.booking_id
JOIN Users u ON b.user_id = u.user_id;