-- view for displaying user favorites
CREATE VIEW User_Favorites_Details AS
SELECT u.user_name, p.property_id, p.property_type, p.categories
FROM User_Favorites uf
JOIN Users u ON uf.user_id = u.user_id
JOIN Properties p ON uf.property_id = p.property_id;
