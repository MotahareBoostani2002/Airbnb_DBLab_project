-- procedure for user's signup
CREATE PROCEDURE User_Signup
    @user_name VARCHAR(50),
    @email VARCHAR(50),
    @phone_number VARCHAR(15),
    @password VARCHAR(50)
AS
BEGIN
    if exists (select * from Users where email = @email)
    print 'User already exists';
    else
    INSERT INTO Users (user_name, email, phone_number, [password])
    VALUES (@user_name, @email, @phone_number, @password);
    print 'User signed up successfully';
END;

-- procedure for user's login
CREATE PROCEDURE User_Login
    @email VARCHAR(50),
    @password VARCHAR(50)
AS
BEGIN
    if exists (select * from Users where email = @email and [password] = @password)
    print 'User logged in successfully';
    else
    print 'Invalid email or password';
END;

-- procedure for checking availablity of properties
CREATE PROCEDURE Check_Availability
    @city VARCHAR(50),
    @check_in_date DATE,
    @check_out_date DATE
AS
BEGIN
    SELECT p.property_id, p.property_type, p.num_bedrooms, p.num_bathrooms, p.max_guests, p.price_per_night
    FROM Properties p
    JOIN Locations l ON p.location_id = l.location_id
    WHERE l.city = @city
    AND p.availability = 1;
END;



-- procedure for booking a property
CREATE PROCEDURE Book_Property
    @user_id INT,
    @property_id INT,
    @host_id INT,
    @booking_date DATE,
    @check_in_date DATE,
    @check_out_date DATE,
    @num_guests INT,
AS
BEGIN
    INSERT INTO Bookings (user_id, property_id, host_id, booking_date, check_in_date, check_out_date, num_guests, total_cost)
    VALUES (@user_id, @property_id, @host_id, @booking_date, @check_in_date, @check_out_date, @num_guests, calculate_cost(@price_per_night, @check_in_date, @check_out_date);
    print 'Property booked successfully';
END;


-- procedure for canceling a booking 
CREATE PROCEDURE Cancel_Booking
    @booking_id INT
AS
BEGIN
    DELETE FROM Bookings
    WHERE booking_id = @booking_id;
    print 'Booking canceled successfully';
END;






-- procedure for filtering properties by amenities
CREATE PROCEDURE Filter_By_Amenities
    @amenity_name VARCHAR(50)
AS
    SELECT p.property_id, p.property_type, p.num_bedrooms, p.num_bathrooms, p.max_guests, p.price_per_night
    FROM Properties p
    JOIN Property_Amenities pa ON p.property_id = pa.property_id
    JOIN Amenities a ON pa.amenity_id = a.amenity_id
    WHERE a.amenity_name = @amenity_name;
END;

-- procedure for filtering properties by categories
CREATE PROCEDURE Filter_By_Categories
    @categories VARCHAR(50)
AS
    SELECT p.property_id, p.property_type, p.num_bedrooms, p.num_bathrooms, p.max_guests, p.price_per_night
    FROM Properties p
    WHERE p.categories = @categories;
END;

-- procedure for filtering properties by cost
CREATE PROCEDURE Filter_By_Cost
    @min_cost DECIMAL(4),
    @max_cost DECIMAL(4)
AS
    SELECT p.property_id, p.property_type, p.num_bedrooms, p.num_bathrooms, p.max_guests, p.price_per_night
    FROM Properties p
    WHERE p.price_per_night BETWEEN @min_cost AND @max_cost;
END;

-- procedure for filtering properties by property average rate
CREATE PROCEDURE Filter_By_Rating
    @min_rating DECIMAL(2, 1),
    @max_rating DECIMAL(2, 1)
AS
    SELECT p.property_id, p.property_type, p.num_bedrooms, p.num_bathrooms, p.max_guests, p.price_per_night
    FROM Properties p
    JOIN Reviews r ON p.property_id = r.property_id
    GROUP BY p.property_id
    HAVING AVG(r.review_rating) BETWEEN @min_rating AND @max_rating;
END;

-- procedure for adding review for property by user
CREATE PROCEDURE Add_Review
    @user_id INT,
    @property_id INT,
    @review_date DATE,
    @review_rating INT,
    @review_text TEXT
AS
BEGIN
    INSERT INTO Reviews (user_id, property_id, review_date, review_rating, review_text)
    VALUES (@user_id, @property_id, @review_date, @review_rating, @review_text);
    print 'Review added successfully';
END;

-- procedure for adding property to user's favorites
CREATE PROCEDURE Add_To_Favorites
    @user_id INT,
    @property_id INT
AS
BEGIN
    INSERT INTO User_Favorites (user_id, property_id)
    VALUES (@user_id, @property_id);
    print 'Property added to favorites';
END;

-- procedure for removing property from user's favorites
CREATE PROCEDURE Remove_From_Favorites
    @user_id INT,
    @property_id INT
AS
BEGIN
    DELETE FROM User_Favorites
    WHERE user_id = @user_id AND property_id = @property_id;
    print 'Property removed from favorites';
END;

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

-- procedure for add a property by host
CREATE PROCEDURE Add_Property
    @host_id INT,
    @location_id INT,
    @property_type VARCHAR(50),
    @categories VARCHAR(50),
    @num_bedrooms INT,
    @num_bathrooms INT,
    @max_guests INT,
    @area DECIMAL(4),
    @price_per_night DECIMAL(4),
    @availability BIT
AS
BEGIN
    INSERT INTO Properties (host_id, location_id, property_type, categories, num_bedrooms, num_bathrooms, max_guests, area, price_per_night, availability)
    VALUES (@host_id, @location_id, @property_type, @categories, @num_bedrooms, @num_bathrooms, @max_guests, @area, @price_per_night, @availability);
    print 'Property added successfully';
END;


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



