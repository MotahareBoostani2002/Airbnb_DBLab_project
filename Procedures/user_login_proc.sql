-- procedure for user's login
CREATE PROCEDURE User_Login
    @email VARCHAR(50),
    @password VARCHAR(50)
AS
BEGIN
    if exists (select * from Users where email = @email and [password] = @password)
    print 'User logged in successfully';
    else
    print 'Invalid email or password';
END;

EXEC User_Login 'joe@gmail.com' , 'password1';