------------------- drop -------------------
/*
drop table [Messages];
drop table Reviews;
drop table Payments;
drop table Bookings;
drop table User_Favorites;
drop table Property_Amenities;
drop table Amenities ;
drop table Property_Images;
drop table Properties;
drop table Locations;
drop table Users;
drop table Hosts;
*/

------------------ Create ------------------

-- Create the Hosts table
CREATE TABLE Hosts (
    host_id INT PRIMARY KEY identity(1,1),
    host_name VARCHAR(50) NOT NULL UNIQUE,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(50) NOT NULL UNIQUE,
    phone_number VARCHAR(15) NOT NULL UNIQUE,
    [password] VARCHAR(50) NOT NULL,
    host_since DATE NOT NULL,
    -- derived attribute "hosting_duration" based on host_since
    hosting_duration AS (DATEDIFF(YEAR, host_since, GETDATE())),
    host_response_time VARCHAR(50) NOT NULL check(host_response_time in ('within an hour', 'within a few hours', 'within a day', 'a few days or more')),
    host_rate DECIMAL(2, 1) NOT NULL check (host_rate between 0 and 5),
    host_identity_verified BIT NOT NULL
);


-- Create the user table
CREATE TABLE Users (
    user_id INT PRIMARY KEY identity(1,1),
    user_name VARCHAR(50) NOT NULL UNIQUE,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(50) NOT NULL UNIQUE,
    phone_number VARCHAR(15) NOT NULL UNIQUE,
    [password] VARCHAR(50) NOT NULL,
    birth_date DATE NOT NULL,
    -- derived attribute "age" based on birth_date
    age AS (DATEDIFF(YEAR, birth_date, GETDATE())),
);


-- Create the Locations table
CREATE TABLE Locations (
    location_id INT PRIMARY KEY identity(1,1),
    city VARCHAR(50) NOT NULL,
    street VARCHAR(100) NOT NULL,
    latitude DECIMAL(10, 8) NOT NULL,
    longitude DECIMAL(11, 8) NOT NULL
);


-- Create the property table
CREATE TABLE Properties (
    property_id INT PRIMARY KEY identity(1,1),
    host_id INT NOT NULL,
    location_id INT NOT NULL,
    property_type VARCHAR(50) NOT NULL check(property_type in ('house', 'apartment', 'townhouse', 'villa', 'guest suite', 'tiny house', 'cabin', 'treehouse', 'other')),
    categories VARCHAR(50) NOT NULL check(categories in ('Family', 'Pet-friendly', 'Couples', 'Friends', 'Party', 'Budget-friendly')),
    num_bedrooms INT NOT NULL,
    num_bathrooms INT NOT NULL,
    max_guests INT NOT NULL,
    area DECIMAL(4) NOT NULL,
    price_per_night DECIMAL(4) NOT NULL,
    [availability] BIT NOT NULL,
    [description] TEXT,
    FOREIGN KEY (host_id) REFERENCES Hosts(host_id),
    FOREIGN KEY (location_id) REFERENCES Locations(location_id)
);


-- Create property images table
-- multivalued attribute
CREATE TABLE Property_Images (
    image_id INT PRIMARY KEY identity(1,1),
    property_id INT NOT NULL,
    image_url VARCHAR(100) NOT NULL,
    FOREIGN KEY (property_id) REFERENCES Properties(property_id)
);


-- Create the amenities table
CREATE TABLE Amenities (
    amenity_id INT PRIMARY KEY identity(1,1),
    amenity_name VARCHAR(50) NOT NULL,
    amenity_description TEXT
);


-- Create the property_amenities table
CREATE TABLE Property_Amenities (
    property_id INT,
    amenity_id INT,
    PRIMARY KEY (property_id, amenity_id),
    FOREIGN KEY (property_id) REFERENCES Properties(property_id),
    FOREIGN KEY (amenity_id) REFERENCES Amenities(amenity_id)
);


-- Create the user_favorites table
CREATE TABLE User_Favorites (
    user_id INT,
    property_id INT,
    PRIMARY KEY (user_id, property_id),
    FOREIGN KEY (user_id) REFERENCES Users(user_id),
    FOREIGN KEY (property_id) REFERENCES Properties(property_id)
);


-- Create the bookings table
CREATE TABLE Bookings (
    booking_id INT PRIMARY KEY identity(1,1),
    user_id INT NOT NULL,
    property_id INT NOT NULL,
    host_id INT NOT NULL,
    booking_date DATE NOT NULL,
    check_in_date DATE NOT NULL,
    check_out_date DATE NOT NULL,
    staying_duration AS DATEDIFF(day, check_out, check_in),
    num_guests INT NOT NULL,
    total_cost DECIMAL(10),
    FOREIGN KEY (user_id) REFERENCES Users(user_id),
    FOREIGN KEY (host_id) REFERENCES Hosts(host_id),
    FOREIGN KEY (property_id) REFERENCES Properties(property_id)
);


-- Create the payment table
-- weak entity, (identifying by booking_id)
CREATE TABLE Payments (
    payment_id INT PRIMARY KEY identity(1,1),
    booking_id INT NOT NULL,
    payment_date DATE NOT NULL,
    payment_amount DECIMAL(10) NOT NULL,
    payment_method VARCHAR(50) NOT NULL check(payment_method in ('credit card', 'paypal', 'cash')),
    FOREIGN KEY (booking_id) REFERENCES Bookings(booking_id)
);


-- Create the reviews table
-- weak entity, (identifying by review_id)
CREATE TABLE Reviews (
    review_id INT PRIMARY KEY identity(1,1),
    user_id INT NOT NULL,
    property_id INT NOT NULL,
    review_date DATE NOT NULL,
    review_rating DECIMAL(2,1) NOT NULL,
    review_text TEXT,
    FOREIGN KEY (user_id) REFERENCES Users(user_id),
    FOREIGN KEY (property_id) REFERENCES Properties(property_id),
    -- derived attribute "is_recent_review" based on review_date
    is_recent_review AS (CASE WHEN DATEDIFF(DAY, review_date, GETDATE()) <= 30 THEN 1 ELSE 0 END)
);


-- Create the messages table
CREATE TABLE [Messages] (
    message_id INT PRIMARY KEY identity(1,1),
    user_id INT NOT NULL,
    host_id INT NOT NULL,
    message_date DATE NOT NULL,
    message_time TIME NOT NULL,
    message_text TEXT,
    FOREIGN KEY (user_id) REFERENCES Users(user_id),
    FOREIGN KEY (host_id) REFERENCES Hosts(host_id)
);

