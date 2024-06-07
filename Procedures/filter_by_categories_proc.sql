-- procedure for filtering properties by categories
CREATE PROCEDURE Filter_By_Categories
    @categories VARCHAR(50)
AS
BEGIN
    SELECT p.property_id, p.property_type, p.num_bedrooms, p.num_bathrooms, p.max_guests, p.price_per_night
    FROM Properties p
    WHERE p.categories = @categories;
END;

EXEC Filter_By_Categories 'Party';
