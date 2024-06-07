-- procedure for filtering properties by amenities
CREATE PROCEDURE Filter_By_Amenities
    @amenity_name VARCHAR(50)
AS
BEGIN
    SELECT p.property_id, p.property_type, p.categories ,p.num_bedrooms, p.num_bathrooms, p.max_guests, p.price_per_night
    FROM Properties p
    JOIN Property_Amenities pa ON p.property_id = pa.property_id
    JOIN Amenities a ON pa.amenity_id = a.amenity_id
    WHERE a.amenity_name = @amenity_name;
END;

EXEC Filter_By_Amenities 'Wifi';