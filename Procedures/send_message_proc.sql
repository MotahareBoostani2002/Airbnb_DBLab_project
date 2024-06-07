-- procedure for sending message to host
CREATE PROCEDURE Send_Message
    @user_id INT,
    @host_id INT,
    @message_date DATE,
    @message_time TIME,
    @message_text TEXT
AS
BEGIN
    INSERT INTO Messages (user_id, host_id, message_date, message_time, message_text)
    VALUES (@user_id, @host_id, @message_date, @message_time, @message_text);
    print 'Message sent successfully';
END;

SELECT * From Messages;

EXEC Send_Message 1, 1, '2021-01-01', '12:00:00', 'Hi, I am interested in booking your property';

SELECT * From Messages;
