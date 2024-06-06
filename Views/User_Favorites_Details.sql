-- view for displaying user favorites with reviews and rate
CREATE VIEW User_Favorites_Details AS
SELECT u.user_name, p.property_id, p.property_type, p.categories, r.rate, r.text
FROM User_Favorites uf
JOIN Users u ON uf.user_id = u.user_id
JOIN Properties p ON uf.property_id = p.property_id
JOIN Reviews r ON uf.property_id = r.property_id;
