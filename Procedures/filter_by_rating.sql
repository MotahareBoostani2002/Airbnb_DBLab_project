-- procedure for filtering properties by property average rate
CREATE PROCEDURE Filter_By_Rating
    @min_rating DECIMAL(2, 1),
    @max_rating DECIMAL(2, 1)
AS
BEGIN
    SELECT p.property_id, p.property_type, p.num_bedrooms, p.num_bathrooms, p.max_guests, p.price_per_night
    FROM Properties p
    JOIN Reviews r ON p.property_id = r.property_id
    GROUP BY p.property_id
    HAVING AVG(r.review_rating) BETWEEN @min_rating AND @max_rating;
END;
