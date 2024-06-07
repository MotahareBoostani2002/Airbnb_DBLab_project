-- procedure for adding images to a property
CREATE PROCEDURE Add_Property_Images
    @property_id INT,
    @image_url VARCHAR(100)
AS
BEGIN
    INSERT INTO Property_Images (property_id, image_url)
    VALUES (@property_id, @image_url);
    print 'Image added successfully';
END;

EXEC Add_Property_Images 1, 'https://example.com/image1_new.jpg';

SELECT * FROM Property_Images;