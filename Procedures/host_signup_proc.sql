CREATE Procedure Host_signup
    @host_name VARCHAR(50),
    @first_name VARCHAR(50),
    @last_name VARCHAR(50),
    @birth_date DATE,
    @email VARCHAR(50),
    @phone_number VARCHAR(50),
    @password VARCHAR(50),
    @host_response_time VARCHAR(50)
AS
BEGIN
    if exists (select * from Hosts where email = @email)
    print 'Host already exists';
    else if (select DATEDIFF(YEAR, @birth_date, GETDATE())) < 18
    print 'Host must be at least 18 years old';
    else
    INSERT INTO Hosts ([host_name], first_name, last_name, email, phone_number, [password], host_since, host_response_time, host_rate, host_identity_verified)
    VALUES (@host_name, @first_name, @last_name, @email, @phone_number, @password, GETDATE(), @host_response_time, 0, 1);
    print 'Host signed up successfully';
END;    

SELECT * FROM Hosts;

EXEC Host_signup 'Akbar_Akbari', 'Akbar', 'Akbari', 'akbarakbari@gmail.com', '156-243-908', 'akbarpassword', 'within an hour';

SELECT * FROM Hosts;
