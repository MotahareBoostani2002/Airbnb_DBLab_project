-- procedure for user's signup
CREATE PROCEDURE User_Signup
    @user_name VARCHAR(50),
    @email VARCHAR(50),
    @phone_number VARCHAR(15),
    @password VARCHAR(50)
AS
BEGIN
    if exists (select * from Users where email = @email)
    print 'User already exists';
    else
    INSERT INTO Users (user_name, email, phone_number, [password])
    VALUES (@user_name, @email, @phone_number, @password);
    print 'User signed up successfully';
END;

EXEC User_Signup 'Motahare', 'motahare@gmail.com', '111-111-1234', 'motaharepassword'
EXEC User_Signup 'Mohammad', 'mohammad@gmail.com', '111-111-4321', 'mohammadpassword'
