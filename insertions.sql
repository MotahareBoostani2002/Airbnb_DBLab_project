-- Insertion into hosts table
INSERT INTO Hosts (host_name, first_name, last_name, email, [password] ,phone_number, host_since, host_response_time, host_rate, host_identity_verified)
VALUES 
('John_Doe'        ,'John'   ,'Doe'      ,'johndoe@gmail.com'          ,'123-456-7890' ,'john123'    ,'2020-01-01', 'within an hour'    , 4.5, 1),
('Jane_Smith'      ,'Jane'   ,'Smith'    ,'janesmith@gmail.com'        ,'234-567-8901' ,'jane123'    ,'2019-05-01', 'within a few hours', 3.9, 1),
('Alice_Johnson'   ,'Alice'  ,'Johnson'  ,'alicejohnson@gmail.com'     ,'345-678-9012' ,'alice123'   ,'2018-01-20', 'within a day'      , 4.2, 1),
('Bob_Brown'       ,'Bob'    ,'Brown'    ,'bobbrown@gmail.com'         ,'456-789-0123' ,'bob123'     ,'2017-04-25', 'a few days or more', 3.8, 1),
('Charlie_Anderson','Charlie','Anderson' ,'charlieanderson@gmail.com'  ,'567-890-1234' ,'charlie123' ,'2016-12-19', 'within an hour'    , 4.7, 1),
('David_Gilbert'   ,'David'  ,'Gilbeert' ,'davidgilbert@gmail.com'     ,'678-901-2345' ,'david123'   ,'2021-05-18', 'within a few hours', 4.1, 1);

SELECT * FROM Hosts;


-- Insertion into users table
INSERT INTO Users ([user_name], first_name, last_name, email, phone_number, [password], birth_date)
VALUES
('Joe_Williams'     ,'Joe'    ,'Williams'  , 'joe@gmail.com'    , '111-222-3333' , 'Joe123'     , '2000-01-01'),
('Emily_Rodriguez'  ,'Emily'  ,'Rodriguez' , 'emily@gmail.com'  , '222-333-4444' , 'Emily123'   , '2003-08-02'),
('Jason_Martinez'   ,'Jason'  ,'Martinez'  , 'jason@gmail.com'  , '333-444-5555' , 'Jason123'   , '1997-05-19'),
('Vanessa_Hernandez','Vanessa','Hernandez' , 'vanessa@gmail.com', '444-555-6666' , 'Vanessa123' , '1986-12-23'),
('Mickle_Gonzalez'  ,'Mickle' ,'Gonzalez'  , 'mickle@gmail.com' , '555-666-7777' , 'Mickle123'  , '1974-09-29'),
('Bryan_Lopez'      ,'Bryan'  ,'Lopez'     , 'bryan@gmail.com'  , '666-777-8888' , 'Bryan123'   , '1969-02-14'),
('Simon_Taylor'     ,'Simon'  ,'Taylor'    , 'simon@gmail.com'  , '777-888-9999' , 'Simon123'   , '1991-03-06'),
('Henry_Wilson'     ,'Henry'  ,'Wilson'    , 'henry@gmail.com'  , '888-999-1111' , 'Henry123'   , '1999-06-05'),
('Sarah_Moore'      ,'Sarah'  ,'Moore'     , 'sarah@gmail.com'  , '222-111-5555' , 'Sarahq123'  , '1980-11-11'),
('Rose_Jackson'     ,'Rose'   ,'Jackson'   , 'rose@gmail.com'   , '777-444-1111' , 'Rose123'    , '2001-07-12');

SELECT * FROM Users;


-- Insertion into locations table
INSERT INTO Locations (city, street, latitude, longitude)
VALUES 
('New York'   , '123 Main St'  , 40.7128, -74.0060),
('Los Angeles', '456 Elm St'   , 34.0522, -118.2437),
('Chicago'    , '789 Oak St'   , 41.8781, -87.6298),
('Houston'    , '101 Pine St'  , 29.7604, -95.3698),
('Hawaii'     , '202 Maple St' , 33.4484, -112.0740);

SELECT * FROM Locations;


-- Insertion into properties table
INSERT INTO Properties 
(host_id, location_id, property_type, categories, num_bedrooms, num_bathrooms, max_guests, area, price_per_night, availability)
VALUES 
(1, 1, 'house'       ,'Family'         , 3 , 2 , 5 , 200 , 1500 , 1),
(3, 2, 'apartment'   ,'Budget-friendly', 2 , 1 , 4 , 150 , 900  , 1),
(2, 5, 'villa'       ,'Party'          , 4 , 2 , 10, 400 , 5200 , 1),
(5, 4, 'guest suite' ,'Friends'        , 3 , 2 , 6 , 150 , 1500 , 1),
(3, 1, 'apartment'   ,'Party'          , 2 , 1 , 4 , 100 , 1700 , 1),
(2, 5, 'villa'       ,'Pet-friendly'   , 3 , 2 , 7 , 300 , 3500 , 1),
(2, 4, 'house'       ,'Budget-friendly', 2 , 2 , 6 , 200 , 1500 , 1),
(4, 1, 'cabin'       ,'Friends'        , 1 , 1 , 4 , 80  , 1500 , 1),
(4, 2, 'treehouse'   ,'Couples'        , 1 , 1 , 2 , 50  , 3500 , 1),
(3, 3, 'apartment'   ,'Family'         , 2 , 1 , 4 , 180 , 1000 , 1);

SELECT * FROM Properties;


-- Insertion into property images table
INSERT INTO Property_Images (property_id, image_url)
VALUES 
(1 , 'https://example.com/image1.jpg') ,
(1 , 'https://example.com/image2.jpg') ,
(2 , 'https://example.com/image3.jpg') ,
(2 , 'https://example.com/image4.jpg') ,
(3 , 'https://example.com/image5.jpg') ,
(3 , 'https://example.com/image6.jpg') ,
(4 , 'https://example.com/image7.jpg') ,
(4 , 'https://example.com/image8.jpg') ,
(5 , 'https://example.com/image9.jpg') ,
(5 , 'https://example.com/image10.jpg'),
(6 , 'https://example.com/image11.jpg'),
(6 , 'https://example.com/image12.jpg'),
(7 , 'https://example.com/image13.jpg'),
(7 , 'https://example.com/image14.jpg'),
(8 , 'https://example.com/image15.jpg'),
(8 , 'https://example.com/image16.jpg'),
(9 , 'https://example.com/image17.jpg'),
(9 , 'https://example.com/image18.jpg'),
(10, 'https://example.com/image19.jpg'),
(10, 'https://example.com/image20.jpg');

SELECT * FROM Property_Images;


-- Insertion into amenities table
INSERT INTO Amenities (amenity_name, amenity_description)
VALUES 
('Wifi'                  , 'High-speed internet access'),
('Kitchen'               , 'Fully equipped kitchen'),
('TV'                    , 'Flat-screen TV with cable'),
('Air conditioning'      , 'Central air conditioning'),
('Heating'               , 'Central heating system'),
('Washer'                , 'In-unit washer and dryer'),
('Dryer'                 , 'In-unit washer and dryer'),
('Parking'               , 'Free parking on premises'),
('Pool'                  , 'Private or shared pool'),
('Hot tub'               , 'Private or shared hot tub'),
('Gym'                   , 'Fitness center or private gym'),
('Balcony'               , 'Private balcony or patio'),
('Garden'                , 'Private garden or backyard'),
('BBQ'                   , 'Outdoor BBQ grill'),
('Fireplace'             , 'Indoor or outdoor fireplace'),
('Game room'             , 'Entertainment room with games'),
('Beach access'          , 'Direct access to the beach'),
('Ski-in/ski-out'        , 'Direct access to ski slopes'),
('Elevator'              , 'Private or shared elevator'),
('Wheelchair accessible' , 'Accessible for guests with disabilities');

SELECT * FROM Amenities;


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

SELECT * FROM Property_Amenities;


-- Insertion into user_favorites table
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

SELECT * FROM User_Favorites;


-- Insertion into bookings table
INSERT INTO Bookings (user_id, property_id, host_id, booking_date, check_in_date, check_out_date, num_guests) -- total_cost can be NULL
VALUES
(1 , 1 , 1 , '2020-02-01' , '2020-02-01' , '2020-02-05' , 5),
(2 , 2 , 3 , '2020-04-01' , '2020-04-02' , '2020-04-05' , 3),
(3 , 3 , 2 , '2021-05-03' , '2021-05-05' , '2021-05-06' , 8),
(4 , 4 , 5 , '2021-06-01' , '2021-06-03' , '2021-06-08' , 3),
(5 , 5 , 3 , '2021-12-02' , '2021-12-03' , '2021-12-05' , 4),
(6 , 6 , 2 , '2022-10-04' , '2022-10-08' , '2022-10-12' , 5),
(7 , 7 , 2 , '2022-11-01' , '2022-11-03' , '2022-11-09' , 3),
(8 , 8 , 4 , '2022-11-10' , '2022-11-11' , '2022-11-15' , 2),
(9 , 9 , 4 , '2023-03-01' , '2023-03-04' , '2023-03-06' , 2),
(10, 10, 3 , '2024-06-14' , '2024-06-19' , '2024-06-21' , 3);

SELECT * FROM Bookings;


-- Insertion into payments table
INSERT INTO Payments (booking_id, payment_date, payment_amount, payment_method)
VALUES
(1,  '2020-02-06', 0000, 'credit card'),
(2,  '2020-03-01', 0000, 'credit card'),
(3,  '2021-05-08', 0000, 'paypal'),
(4,  '2021-06-02', 0000, 'cash'),
(5,  '2021-12-02', 0000, 'credit card'),
(6,  '2022-10-10', 0000, 'cash'),
(7,  '2022-11-10', 0000, 'paypal'),
(8,  '2022-11-10', 0000, 'cash'),
(9,  '2023-03-02', 0000, 'credit card'),
(10, '2024-06-17', 0000, 'cash');

SELECT * FROM Payments;


-- Insertion into reviews table
INSERT INTO Reviews (user_id, property_id, review_date, review_rating, review_text)
VALUES
(1 , 1 , '2020-02-08' , 5 , 'Great place to stay!'),
(2 , 2 , '2020-04-07' , 4 , 'Nice location and amenities.'),
(3 , 3 , '2021-05-06' , 5 , 'Amazing villa with beautiful views.'),
(4 , 4 , '2021-06-09' , 3 , 'Decent guest suite, could use some improvements.'),
(5 , 5 , '2021-12-05' , 4 , 'Good apartment for the price.'),
(6 , 6 , '2022-10-13' , 5 , 'Luxurious villa with great amenities.'),
(7 , 7 , '2022-11-10' , 4 , 'Nice house with plenty of space.'),
(8 , 8 , '2022-11-16' , 3 , 'Cozy cabin, but a bit small.'),
(9 , 9 , '2023-03-07' , 5 , 'Great house for a family vacation.'),
(10, 10, '2024-06-22' , 4 , 'Good apartment with a nice view.');

SELECT * FROM Reviews;


-- Insertion into messages table
INSERT INTO [Messages] (user_id, host_id, message_date, message_time, message_text)
VALUES
(1 , 1 , '2020-01-25' , '12:00:00' , 'Hi, I am interested in booking your property.'),
(2 , 3 , '2020-03-29' , '13:00:00' , 'Can you provide more information about the amenities?'),
(3 , 2 , '2021-05-01' , '14:00:00' , 'Is the property available for the dates?'),
(4 , 5 , '2021-05-27' , '15:00:00' , 'Can you offer a discount for a longer stay?'),
(5 , 3 , '2021-11-28' , '16:00:00' , 'I have some special requests, can you accommodate?'),
(6 , 2 , '2022-10-01' , '17:00:00' , 'What is the check-in process like?'),
(7 , 2 , '2022-10-24' , '18:00:00' , 'Can you provide directions to the property?'),
(8 , 4 , '2022-11-04' , '19:00:00' , 'Are pets allowed at the property?'),
(9 , 4 , '2023-02-28' , '20:00:00' , 'Is there a cleaning fee for the property?'),
(10, 3 , '2024-06-08' , '21:00:00' , 'Can you recommend local attractions?');

SELECT * FROM [Messages];


