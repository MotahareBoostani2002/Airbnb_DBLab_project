-- procedure for adding images to a property
CREATE PROCEDURE Add_Property_Images
    @property_id INT,
    @image_url VARCHAR(100)
AS
BEGIN
	--DECLARE @image_id 
	--SET @image_id =  = (SELECT MAX(image_id) FROM Property_Images;
    --SET @image_id = @image_id;
	-- or we can set the image_id as 'identity' in creating this table (property_image) so it will be handled by itself (which makes more sense!)

    INSERT INTO Property_Images (property_id, image_url)
    VALUES (@property_id, @image_url);
    print 'Image added successfully';
END;

EXEC Add_Property_Images 1, 'https://www.example.com/image1.jpg';