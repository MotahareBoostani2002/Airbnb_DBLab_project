-- procedure for filtering properties by cost
CREATE PROCEDURE Filter_By_Cost
    @min_cost DECIMAL(4),
    @max_cost DECIMAL(4)
AS
BEGIN
    SELECT p.property_id, p.property_type, p.num_bedrooms, p.num_bathrooms, p.max_guests, p.price_per_night
    FROM Properties p
    WHERE p.price_per_night BETWEEN @min_cost AND @max_cost;
END;

EXEC Filter_By_Cost 100, 200; 
