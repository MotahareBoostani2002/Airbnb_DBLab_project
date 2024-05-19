-- view for displaying user messages
CREATE VIEW User_Messages AS
SELECT u.user_name, h.host_name, m.message_date, m.message_time, m.message_text
FROM Messages m
JOIN Users u ON m.user_id = u.user_id
JOIN Hosts h ON m.host_id = h.host_id;