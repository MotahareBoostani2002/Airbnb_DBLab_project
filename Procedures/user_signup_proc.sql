-- procedure for user's signup
CREATE PROCEDURE User_Signup
    @user_name VARCHAR(50),
    @first_name VARCHAR(50),
    @last_name VARCHAR(50),
    @email VARCHAR(50),
    @phone_number VARCHAR(15),
    @password VARCHAR(50),
    @birth_date DATE
AS
BEGIN
    if exists (select * from Users where email = @email)
    print 'User already exists';
    else
    INSERT INTO Users ([user_name], first_name, last_name, email, phone_number, [password], birth_date)
    VALUES (@user_name, @first_name, @last_name, @email, @phone_number, @password, @birth_date);
    print 'User signed up successfully';
END;

SELECT * FROM Users;

EXEC User_Signup 'Motahare_Boostani'         , 'Motahare'     , 'Boostani'     ,'motahare@gmail.com', '111-111-1234', 'motaharepassword','2002-10-09';
EXEC User_Signup 'MohammadMahdi_Azarbayejani', 'MohammadMahdi', 'Azarbayejani' ,'mohammad@gmail.com', '111-111-4321', 'mohammadpassword','2003-02-21';


SELECT * FROM Users;