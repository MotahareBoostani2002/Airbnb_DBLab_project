-- view for displaying property details
CREATE VIEW Property_Details AS
SELECT p.property_id, p.host_id, h.host_name, h.email, h.phone_number, p.location_id, l.city, l.street, l.latitude, l.longitude, p.property_type, p.categories, p.num_bedrooms, p.num_bathrooms, p.max_guests, p.area, p.price_per_night, p.availability
FROM Properties p
JOIN Hosts h ON p.host_id = h.host_id
JOIN Locations l ON p.location_id = l.location_id;