-- procedure for checking availablity of properties
CREATE PROCEDURE Check_Availability
    @city VARCHAR(50),
    @check_in_date DATE,
    @check_out_date DATE
AS
BEGIN
    SELECT p.property_id, p.property_type, p.num_bedrooms, p.num_bathrooms, p.max_guests, p.price_per_night
    FROM Properties p
    JOIN Locations l ON p.location_id = l.location_id
    WHERE l.city = @city
    AND p.availability = 1;
END;