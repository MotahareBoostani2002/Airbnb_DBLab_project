-- Airbnb database SQL tables

-- Create the property table
CREATE TABLE Properties (
    property_id INT PRIMARY KEY,
    host_id INT NOT NULL,
    location_id INT NOT NULL,
    property_type VARCHAR(50) NOT NULL check(property_type in ('house', 'apartment', 'townhouse', 'villa', 'guest suite', 'tiny house', 'cabin', 'treehouse', 'other')),
    categories VARCHAR(50) NOT NULL check(categories in ('Family', 'Pet-friendly', 'Couples', 'Friends', 'Party', 'Budget-friendly')),
    num_bedrooms INT NOT NULL,
    num_bathrooms INT NOT NULL,
    max_guests INT NOT NULL,
    area DECIMAL(4) NOT NULL,
    price_per_night DECIMAL(4) NOT NULL,
    availability BOOLEAN NOT NULL,
    FOREIGN KEY (host_id) REFERENCES Hosts(host_id),
    FOREIGN KEY (location_id) REFERENCES Locations(location_id)
);

-- Insertion into properties table
INSERT INTO Properties 
(property_id, host_id, location_id, categories, property_type, num_bedrooms, num_bathrooms, max_guests, price_per_night, availability, area)
VALUES 
(1, 1, 1, 'house'       , 'Family', 3, 2, 5, 200, 1500, 1),
(2, 3, 2, 'apartment'   , 'Budget-friendly', 2, 1, 4, 150, 900, 1),
(3, 2, 5, 'villa'       , 'Party', 4, 2, 10, 400, 5200, 1),
(4, 5, 4, 'guest suite' , 'Friends', 3, 2, 6, 150, 1500, 1),
(5, 3, 1, 'apartment'   , 'Party', 2, 1, 4, 100, 1700, 1),
(6, 2, 5, 'villa'       , 'Pet-friendly', 3, 2, 7, 300, 3500, 1),
(7, 2, 4, 'house'       , 'Budget-friendly', 2, 2, 6, 200, 1500, 1),
(8, 4, 1, 'cabin'       , 'Friends', 1, 1, 4, 80, 1500, 1),
(9, 4, 2, 'treehouse'   , 'Couple', 1, 1, 2, 50, 3500, 1),
(10, 3, 3, 'apartment'  , 'Family', 2, 1, 4, 180, 1000, 1);



-- Create the Hosts table
CREATE TABLE Hosts (
    host_id INT PRIMARY KEY,
    host_name VARCHAR(50) NOT NULL,
    email VARCHAR(50) NOT NULL,
    phone_number VARCHAR(15) NOT NULL,
    host_since DATE NOT NULL,
    host_response_time VARCHAR(50) NOT NULL check(host_response_time in ('within an hour', 'within a few hours', 'within a day', 'a few days or more')),
    host_rate DECIMAL(2, 1) NOT NULL check (host_rate between 0 and 5),
    host_identity_verified BOOLEAN NOT NULL
);
-- insertion into hosts table
INSERT INTO Hosts (host_id, host_name, email, phone_number, host_since, host_response_time, host_rate, host_identity_verified)
VALUES 
(1, 'John Doe', 'johndoe@gmail.com', '123-456-7890', '2020-01-01', 'within an hour', 4.5, 1),
(2, 'Jane Smith', 'janesmith@gmail.com', '234-567-8901', '2019-05-01', 'within a few hours', 3.9, 1),
(3, 'Alice Johnson', 'alicejohnson@gmail.com', '345-678-9012', '2018-01-20', 'within a day', 4.2, 1),
(4, 'Bob Brown', 'bobbrown@gmail.com', '456-789-0123', '2017-04-25', 'a few days or more', 3.8, 1),
(5, 'Charlie Anderson', 'charlieanderson@gmail.com', '567-890-1234', '2016-12-19', 'within an hour', 4.7, 1),
(6, 'David Gilbert', 'davidgilbert@gmail.com', '678-901-2345', '2021-05-18', 'within a few hours', 4.1, 1);



-- Create the Locations table
CREATE TABLE Locations (
    location_id INT PRIMARY KEY,
    city VARCHAR(50) NOT NULL,
    street VARCHAR(100) NOT NULL,
    latitude DECIMAL(10, 8) NOT NULL,
    longitude DECIMAL(11, 8) NOT NULL
);

-- Insertion into locations table
INSERT INTO Locations (location_id, city, street, latitude, longitude)
VALUES 
(1, 'New York', '123 Main St', 40.7128, -74.0060),
(2, 'Los Angeles', '456 Elm St', 34.0522, -118.2437),
(3, 'Chicago', '789 Oak St', 41.8781, -87.6298),
(4, 'Houston', '101 Pine St', 29.7604, -95.3698),
(5, 'Hawaii', '202 Maple St', 33.4484, -112.0740);


-- Create property images table
CREATE TABLE Property_Images (
    image_id INT PRIMARY KEY,
    property_id INT NOT NULL,
    image_url VARCHAR(100) NOT NULL,
    FOREIGN KEY (property_id) REFERENCES Properties(property_id)
);

-- Insertion into property images table
INSERT INTO Property_Images VALUES (1, 1, 'https://example.com/image1.jpg');
INSERT INTO Property_Images VALUES (2, 1, 'https://example.com/image2.jpg');
INSERT INTO Property_Images VALUES (3, 2, 'https://example.com/image3.jpg');
INSERT INTO Property_Images VALUES (4, 2, 'https://example.com/image4.jpg');
INSERT INTO Property_Images VALUES (5, 3, 'https://example.com/image5.jpg');
INSERT INTO Property_Images VALUES (6, 3, 'https://example.com/image6.jpg');
INSERT INTO Property_Images VALUES (7, 4, 'https://example.com/image7.jpg');
INSERT INTO Property_Images VALUES (8, 4, 'https://example.com/image8.jpg');
INSERT INTO Property_Images VALUES (9, 5, 'https://example.com/image9.jpg');
INSERT INTO Property_Images VALUES (10, 5, 'https://example.com/image10.jpg');
INSERT INTO Property_Images VALUES (11, 6, 'https://example.com/image11.jpg');
INSERT INTO Property_Images VALUES (12, 6, 'https://example.com/image12.jpg');
INSERT INTO Property_Images VALUES (13, 7, 'https://example.com/image13.jpg');
INSERT INTO Property_Images VALUES (14, 7, 'https://example.com/image14.jpg');
INSERT INTO Property_Images VALUES (15, 8, 'https://example.com/image15.jpg');
INSERT INTO Property_Images VALUES (16, 8, 'https://example.com/image16.jpg');
INSERT INTO Property_Images VALUES (17, 9, 'https://example.com/image17.jpg');
INSERT INTO Property_Images VALUES (18, 9, 'https://example.com/image18.jpg');
INSERT INTO Property_Images VALUES (19, 10, 'https://example.com/image19.jpg');
INSERT INTO Property_Images VALUES (20, 10, 'https://example.com/image20.jpg');



-- Create the amenities table
CREATE TABLE Amenities (
    amenity_id INT PRIMARY KEY,
    amenity_name VARCHAR(50) NOT NULL,
    amenity_description TEXT
);

-- Insertion into amenities table
INSERT INTO Amenities (amenity_id, amenity_name, amenity_description)
VALUES 
(1, 'Wifi', 'High-speed internet access'),
(2, 'Kitchen', 'Fully equipped kitchen'),
(3, 'TV', 'Flat-screen TV with cable'),
(4, 'Air conditioning', 'Central air conditioning'),
(5, 'Heating', 'Central heating system'),
(6, 'Washer', 'In-unit washer and dryer'),
(7, 'Dryer', 'In-unit washer and dryer'),
(8, 'Parking', 'Free parking on premises'),
(9, 'Pool', 'Private or shared pool'),
(10, 'Hot tub', 'Private or shared hot tub'),
(11, 'Gym', 'Fitness center or private gym'),
(12, 'Balcony', 'Private balcony or patio'),
(13, 'Garden', 'Private garden or backyard'),
(14, 'BBQ', 'Outdoor BBQ grill'),
(15, 'Fireplace', 'Indoor or outdoor fireplace'),
(16, 'Game room', 'Entertainment room with games'),
(17, 'Beach access', 'Direct access to the beach'),
(18, 'Ski-in/ski-out', 'Direct access to ski slopes'),
(19, 'Elevator', 'Private or shared elevator'),
(20, 'Wheelchair accessible', 'Accessible for guests with disabilities');


-- Create the property_amenities table
CREATE TABLE Property_Amenities (
    property_id INT,
    amenity_id INT,
    PRIMARY KEY (property_id, amenity_id),
    FOREIGN KEY (property_id) REFERENCES Properties(property_id),
    FOREIGN KEY (amenity_id) REFERENCES Amenities(amenity_id)
);

-- Insertion into property amenities table
INSERT INTO Property_Amenities (property_id, amenity_id)
VALUES
(1, 2),(1, 3),(1, 4),(1, 6),(1, 14),
(2, 2),(2, 8),(2, 19),
(3, 1),(3, 2),(3, 3),(3, 4),(3, 5),(3, 9),(3, 10),(3, 11),(3, 12),(3, 15),(3, 14),(3, 17),
(4, 2),(4, 4),(4, 3),(4, 1),(4, 19),
(5, 1),(5, 2),(5, 3),(5, 4),(5, 5),(5, 12),
(6, 1),(6, 2),(6, 3),(6, 4),(6, 5),(6, 8),(6, 9),(6, 10),(6, 16),
(7, 2),(7, 4),(7, 5),(7, 20),
(8, 2),(8, 10),(8, 12),(8, 15),
(9, 3),(9, 10),(9, 6),
(10, 4),(10, 2),(10, 3),(10, 8),(10, 12),(10, 14);

-- Create the user table
CREATE TABLE Users (
    user_id INT PRIMARY KEY,
    user_name VARCHAR(50) NOT NULL,
    email VARCHAR(50) NOT NULL,
    phone_number VARCHAR(15) NOT NULL,
    [password] VARCHAR(50) NOT NULL
);

-- insert into users table
INSERT INTO Users (user_id, user_name, email, phone_number, [password])
VALUES 
(1, 'Joe', 'joe@gmail.com', '111-222-3333', 'password1'),
(2, 'Emily', 'emily@gmail.com', '222-333-4444', 'password2'),
(3, 'Jason', 'jason@gmail.com', '333-444-5555', 'password3'),
(4, 'Vanessa', 'vanessa@gmail.com', '444-555-6666', 'password4'),
(5, 'Mickle', 'mickle@gmail.com', '555-666-7777', 'password5'),
(6, 'Bryan', 'bryan@gmail.com', '666-777-8888', 'password6'),
(7, 'Simon', 'simon@gmail.com', '777-888-9999', 'password7'),
(8, 'Henry', 'henry@gmail.com', '888-999-1111', 'password8'),
(9, 'Sarah', 'sarah@gmail.com', '222-111-5555', 'password9'),
(10, 'Rose', 'rose@gmail.com', '777-444-111', 'password10');

-- Create the user_favorites table
CREATE TABLE User_Favorites (
    user_id INT,
    property_id INT,
    PRIMARY KEY (user_id, property_id),
    FOREIGN KEY (user_id) REFERENCES Users(user_id),
    FOREIGN KEY (property_id) REFERENCES Properties(property_id)
);

-- insert into user_favorites table
INSERT INTO User_Favorites (user_id, property_id)
VALUES
(1, 1),
(1, 2),
(2, 3),
(2, 4),
(3, 5),
(3, 6),
(4, 7),
(4, 8),
(5, 9),
(5, 10),
(6, 1),
(6, 2),
(7, 3),
(7, 4),
(8, 5),
(8, 6),
(9, 7),
(9, 8),
(10, 9),
(10, 10);

-- Create the reviews table
CREATE TABLE Reviews (
    review_id INT PRIMARY KEY,
    user_id INT NOT NULL,
    property_id INT NOT NULL,
    review_date DATE NOT NULL,
    review_rating INT NOT NULL,
    review_text TEXT,
    FOREIGN KEY (user_id) REFERENCES Users(user_id),
    FOREIGN KEY (property_id) REFERENCES Properties(property_id)
);

-- insert into reviews table
INSERT INTO Reviews (review_id, user_id, property_id, review_date, review_rating, review_text)
VALUES
(1, 1, 1, '2020-02-08', 5, 'Great place to stay!'),
(2, 2, 2, '2020-04-07', 4, 'Nice location and amenities.'),
(3, 3, 3, '2021-05-06', 5, 'Amazing villa with beautiful views.'),
(4, 4, 4, '2021-06-09', 3, 'Decent guest suite, could use some improvements.'),
(5, 5, 5, '2021-12-05', 4, 'Good apartment for the price.'),
(6, 6, 6, '2022-10-13', 5, 'Luxurious villa with great amenities.'),
(7, 7, 7, '2022-11-10', 4, 'Nice house with plenty of space.'),
(8, 8, 8, '2022-11-16', 3, 'Cozy cabin, but a bit small.'),
(9, 9, 9, '2023-03-07', 5, 'Great house for a family vacation.'),
(10, 10, 10, '2024-06-22', 4, 'Good apartment with a nice view.');

-- create the bookings table
CREATE TABLE Bookings (
    booking_id INT PRIMARY KEY,
    user_id INT NOT NULL,
    host_id INT NOT NULL,
    property_id INT NOT NULL,
    booking_date DATE NOT NULL,
    check_in_date DATE NOT NULL,
    check_out_date DATE NOT NULL,
    num_guests INT NOT NULL,
    total_cost DECIMAL(10) NOT NULL,
    FOREIGN KEY (user_id) REFERENCES Users(user_id),
    FOREIGN KEY (host_id) REFERENCES Hosts(host_id),
    FOREIGN KEY (property_id) REFERENCES Properties(property_id)
);

-- insert into bookings table
INSERT INTO Bookings (booking_id, user_id, host_id, property_id, booking_date, check_in_date, check_out_date, num_guests, total_cost)
VALUES
(1, 1, 1, 1    , '2020-02-01', '2020-02-01', '2020-02-05', 5, 0000),
(2, 2, 2, 3    , '2020-04-01', '2020-04-02', '2020-04-05', 3, 0000),
(3, 3, 3, 2    , '2021-05-03', '2021-05-05', '2021-05-06', 8, 0000),
(4, 4, 4, 5    , '2021-06-01', '2021-06-03', '2021-06-08', 3, 0000),
(5, 5, 5, 3    , '2021-12-02', '2021-12-03', '2021-12-05', 4, 0000),
(6, 6, 6, 2    , '2022-10-04', '2022-10-08', '2022-10-12', 5, 0000),
(7, 7, 7, 2    , '2022-11-01', '2022-11-03', '2022-11-09', 3, 0000),
(8, 8, 8, 4    , '2022-11-10', '2022-11-11', '2022-11-15', 2, 0000),
(9, 9, 9, 4    , '2023-03-01', '2023-03-04', '2023-03-06', 2, 0000),
(10, 10, 10, 3, '2024-06-14', '2024-06-19', '2024-06-21', 3, 0000);

-- Create the payment table
CREATE TABLE Payments (
    payment_id INT PRIMARY KEY,
    booking_id INT NOT NULL,
    payment_date DATE NOT NULL,
    payment_amount DECIMAL(10) NOT NULL,
    payment_method VARCHAR(50) NOT NULL check(payment_method in ('credit card', 'debit card', 'paypal', 'cash')),
    FOREIGN KEY (booking_id) REFERENCES Bookings(booking_id)
);

-- Insertion into payments table
INSERT INTO Payments (payment_id, booking_id, payment_date, payment_amount, payment_method)
VALUES
(1, 1, '2020-02-06', 600, 'credit card'),
(2, 2, '2020-03-01', 400, 'debit card'),
(3, 3, '2021-05-08', 1800, 'paypal'),
(4, 4, '2021-06-02', 300, 'cash'),
(5, 5, '2021-12-02', 400, 'credit card'),
(6, 6, '2022-10-10', 1500, 'debit card'),
(7, 7, '2022-11-10', 450, 'paypal'),
(8, 8, '2022-11-10', 300, 'cash'),
(9, 9, '2023-03-02', 600, 'credit card'),
(10, 10, '2024-06-17', 300, 'debit card');

-- Create the messages table
CREATE TABLE Messages (
    message_id INT PRIMARY KEY,
    user_id INT NOT NULL,
    host_id INT NOT NULL,
    message_date DATE NOT NULL,
    message_time TIME NOT NULL,
    message_text TEXT,
    FOREIGN KEY (user_id) REFERENCES Users(user_id),
    FOREIGN KEY (host_id) REFERENCES Hosts(host_id)
);

-- Insertion into messages table
INSERT INTO Messages (message_id, user_id, host_id, message_date, message_time, message_text)
VALUES
(1, 1, 1, '2020-01-25', '12:00:00', 'Hi, I am interested in booking your property.'),
(2, 2, 2, '2020-03-29', '13:00:00', 'Can you provide more information about the amenities?'),
(3, 3, 3, '2021-05-01', '14:00:00', 'Is the property available for the dates?'),
(4, 4, 4, '2021-05-27', '15:00:00', 'Can you offer a discount for a longer stay?'),
(5, 5, 5, '2021-11-28', '16:00:00', 'I have some special requests, can you accommodate?'),
(6, 6, 6, '2022-10-01', '17:00:00', 'What is the check-in process like?'),
(7, 7, 7, '2022-10-24' , '18:00:00', 'Can you provide directions to the property?'),
(8, 8, 8, '2022-11-04', '19:00:00', 'Are pets allowed at the property?'),
(9, 9, 9, '2023-02-28', '20:00:00', 'Is there a cleaning fee for the property?'),
(10, 10, 10, '2024-06-08', '21:00:00', 'Can you recommend local attractions?');



----------------------------------------
-- Triggers

-- Trigger to update the availability of a property when a booking is made
CREATE TRIGGER Update_Availability
AFTER INSERT ON Bookings
FOR EACH ROW
BEGIN
    UPDATE Properties
    SET availability = 0
    WHERE property_id = NEW.property_id;
END;

-- Trigger to update the availability of a property when a booking is cancelled
CREATE TRIGGER Update_Availability_Cancel
AFTER DELETE ON Bookings
FOR EACH ROW
BEGIN
    UPDATE Properties
    SET availability = 1
    WHERE property_id = OLD.property_id;
END;

-- Trigger to update the total cost of a booking when the check-in or check-out date is changed
CREATE TRIGGER Update_Total_Cost
AFTER UPDATE OF check_in_date, check_out_date ON Bookings
FOR EACH ROW
BEGIN
    UPDATE Bookings
    SET total_cost = DATEDIFF(NEW.check_out_date, NEW.check_in_date) * (SELECT price_per_night FROM Properties WHERE property_id = NEW.property_id)
    WHERE booking_id = NEW.booking_id;
END;

-- Trigger when user sends a message to a host
CREATE TRIGGER Message_Host
AFTER INSERT ON Messages
FOR EACH ROW
BEGIN
    INSERT INTO Messages
    SET user_id = NEW.user_id,
    host_id = NEW.host_id,
    message_date = CURDATE(),
    message_time = CURTIME(),
    message_text = NEW.message_text;
END;

-- Trigger when user joins the platform
CREATE TRIGGER User_Join
AFTER INSERT ON Users
FOR EACH ROW
BEGIN
    INSERT INTO Users
    SET user_name = NEW.user_name,
    email = NEW.email,
    phone_number = NEW.phone_number,
    [password] = NEW.[password];
END;

-- Trigger when user adds a property to favorites
CREATE TRIGGER Add_Favorite
AFTER INSERT ON User_Favorites
FOR EACH ROW
BEGIN
    INSERT INTO User_Favorites
    SET user_id = NEW.user_id,
    property_id = NEW.property_id;
END;

-- Trigger when user leaves a review
CREATE TRIGGER Leave_Review
AFTER INSERT ON Reviews
FOR EACH ROW
BEGIN
    INSERT INTO Reviews
    SET user_id = NEW.user_id,
    property_id = NEW.property_id,
    review_date = CURDATE(),
    review_rating = NEW.review_rating,
    review_text = NEW.review_text;
END;

