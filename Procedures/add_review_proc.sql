-- procedure for adding review for property by user
CREATE PROCEDURE Add_Review
    @user_id INT,
    @property_id INT,
    @review_date DATE,
    @review_rating INT,
    @review_text TEXT
AS
BEGIN
    INSERT INTO Reviews (user_id, property_id, review_date, review_rating, review_text)
    VALUES (@user_id, @property_id, @review_date, @review_rating, @review_text);
    print 'Review added successfully';
END;
