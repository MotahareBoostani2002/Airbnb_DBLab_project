-- procedure for add a property by host
CREATE PROCEDURE Add_Property
    @host_id INT,
    @location_id INT,
    @property_type VARCHAR(50),
    @categories VARCHAR(50),
    @num_bedrooms INT,
    @num_bathrooms INT,
    @max_guests INT,
    @area DECIMAL(4),
    @price_per_night DECIMAL(4),
    @availability BIT
AS
BEGIN
    INSERT INTO Properties (host_id, location_id, property_type, categories, num_bedrooms, num_bathrooms, max_guests, area, price_per_night, availability)
    VALUES (@host_id, @location_id, @property_type, @categories, @num_bedrooms, @num_bathrooms, @max_guests, @area, @price_per_night, @availability);
    print 'Property added successfully';
END;

EXEC Add_Property 1, 1, 'Apartment', 'Budget-friendly', 2, 2, 4, 1000, 200, 1;

SELECT * FROM Properties;