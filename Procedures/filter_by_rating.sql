-- procedure for filtering properties by property average rate
CREATE PROCEDURE Filter_By_Rating
    @min_rating DECIMAL(2, 1),
    @max_rating DECIMAL(2, 1)
AS
BEGIN
    SELECT p.property_id, p.property_type, p.num_bedrooms, p.num_bathrooms, p.max_guests, p.price_per_night,r.review_rating
    FROM Properties p
    JOIN Reviews r ON p.property_id = r.property_id
    where r.review_rating BETWEEN @min_rating AND @max_rating;
END;

exec Filter_By_Rating 3.8, 4.5;