-- procedure for removing property from user's favorites
CREATE PROCEDURE Remove_From_Favorites
    @user_id INT,
    @property_id INT
AS
BEGIN
    DELETE FROM User_Favorites
    WHERE user_id = @user_id AND property_id = @property_id;
    print 'Property removed from favorites';
END;
