CREATE PROCEDURE Host_Login
    @email VARCHAR(50),
    @password VARCHAR(50)
AS
BEGIN
        if exists (select * from Hosts where email = @email and [password] = @password)
        print 'Host logged in successfully';
        else
        print 'Invalid email or password';
END;
 
select * from Hosts;

EXEC Host_Login 'johndoe@gmail.com' , 'john123';

EXEC Host_Login 'johndoe@gmail.com' , 'Jon123456';