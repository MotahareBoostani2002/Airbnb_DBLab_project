-- procedure for filtering properties by property average rate
CREATE PROCEDURE Filter_By_Rating
    @min_rating DECIMAL(2, 1),
    @max_rating DECIMAL(2, 1)
AS
BEGIN
    SELECT r.property_id, CAST(AVG(r.review_rating) AS DECIMAL(2,1)) as average_score
    FROM Properties p
    JOIN Reviews r ON p.property_id = r.property_id
    GROUP BY r.property_id
    HAVING CAST(AVG(r.review_rating) AS DECIMAL(2,1)) BETWEEN @min_rating AND @max_rating;
END;

SELECT * FROM Reviews;

EXEC Filter_By_Rating 1,5;

