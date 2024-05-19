-- view for displaying property amenities
CREATE VIEW Property_Amenities_Details AS
SELECT p.property_id, a.amenity_name, a.amenity_description
FROM Property_Amenities pa
JOIN Amenities a ON pa.amenity_id = a.amenity_id
JOIN Properties p ON pa.property_id = p.property_id;
