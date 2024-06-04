-- procedure for adding property to user's favorites
CREATE PROCEDURE Add_To_Favorites
    @user_id INT,
    @property_id INT
AS
BEGIN
    INSERT INTO User_Favorites (user_id, property_id)
    VALUES (@user_id, @property_id);
    print 'Property added to favorites';
END;


EXEC Add_To_Favorites 1, 1;
