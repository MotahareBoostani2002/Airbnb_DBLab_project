-- view for displaying property reviews
CREATE VIEW Property_Reviews AS
SELECT u.user_name, r.review_date, r.review_rating, r.review_text
FROM Reviews r
JOIN Users u ON r.user_id = u.user_id
JOIN Properties p ON r.property_id = p.property_id;