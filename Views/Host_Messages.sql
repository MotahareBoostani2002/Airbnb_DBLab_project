-- view for displaying host messages
CREATE VIEW Host_Messages AS
SELECT h.host_name, u.user_name, m.message_date, m.message_time, m.message_text
FROM Messages m
JOIN Hosts h ON m.host_id = h.host_id
JOIN Users u ON m.user_id = u.user_id;