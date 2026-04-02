INSERT INTO hotel_chain(hotel_chain_id, street_number, city, province, zip, num_of_hotels, hotel_chain_name)
Values 
(1, 125, 'Foot Lane','Kingston', 'Ontario', 'R2K5I5', 8, 'Star Hotels'),
(2, 13, 'Lazy Lane', 'Ottawa', 'Ontario', 'K3K4I2', 9, 'Jamie Houses You'),
(3, 124, 'Twisted Tower Road', 'Edmonton', 'Alberta', 'H4K5I6', 8, 'Edmonton Best'),
(4, 12, 'Anita Maxwinn Avenue', 'Vancouver', 'British Columbia', 'H3K5O3', 10, 'Chateau Vanny'),
(5, 14, 'Travell Road', 'Hamilton', 'Ontario', 'K4K2H6', 8, 'Alexander Hotels');


insert into hotel_chain_contact_phone(hotel_chain_phone, hotel_chain_id)
values
(8325667382, 1),
(3651737377, 1),
(2648264736, 2),
(3736287598, 2),
(3456664736, 2),
(6139264927, 3),
(2518362536, 4),
(1234567891, 4),
(36483637256,5),
(1254758789,5);


insert into hotel_chain_contact_email(hotel_chain_email, hotel_chain_id)
values 
('hotelsforyou@starhotels.com', 1),
('bookhotels@starhotels.com', 1),
('jhotels@jamiehousesyou.com', 2),
('eddyhotels@edmontonsbest.com', 3),
('edmontonbesthotels@edmontonsbest.com', 3),
('edshotels@edmontonsbest.com', 3),
('chateauvancouver@chateauvanny.com', 4),
('chateauvan@chateauvanny.com', 4),
('bookalexhotels@alexanderhotels.com', 5);

insert into hotel(hotel_id, hotel_chain_id, street_number, street_name, city, province, zip, hotel_name, num_of_rooms, star_rating, manager_ssn)
    values 
    (1, 1, 45, 'Gryffindor Street', 'Kingston', 'Ontario', 'K1R5J3', 'Starring Hotel', 5, 4, 1),
    (2, 1, 91, 'Slytherin Street', 'Ottawa', 'Ontario', 'K4H2I5', 'Starz Hotel', 6, 3, 2),
    (3, 1, 67, 'Hufflepuff Avenue', 'Montreal', 'Quebec', 'L3H5K2', 'Étoile Hotel', 5, 5, 3),
    (4, 1, 5, 'Ravenclaw Street', 'Quebec City', 'Quebec', 'K1R5J3', 'Starry Hotel', 5, 4, 4),
    (5, 1, 57, 'Spiderman Circle', 'Brock', 'Ontario', 'H2I5H5', 'Star Shot Hotel', 6, 3, 5),
    (6, 1, 156, 'Peter Parker Boulevard', 'Picton', 'Ontario', 'D3H5I2', 'Picton Star Hotel', 5, 2, 6),
    (7, 1, 684, 'Potato Port', 'Gatineau', 'Quebec', 'H2I9H5', 'Stargazers Hotel', 5, 4, 7),
    (8, 1, 9, 'Lasagna Crescent', 'Ottawa', 'Ontario', 'K3G0H3', 'Stardome Hotel', 5, 5, 8),
    (9, 2, 888, 'Dogwood Lane', 'Montreal', 'Quebec', 'L2H5B2', 'Jamies Hotel', 5, 5, 9),
    (10, 2, 47, 'Forest Lane', 'Toronto', 'Ontario', 'K2B3K9', 'JamJam Hotel', 5, 3, 10),
    (11, 2, 159, 'Parrot Avenue', 'Edmonton', 'Alberta', 'K2G5J2', 'Jamie Housing Hotel', 5, 4, 11),
    (12, 2, 732, 'Maple Crescent', 'Montreal', 'Quebec', 'V5K2L8', 'Jamie Houses You Downtown', 5, 2, 12),
    (13, 2, 58, 'Pine Street', 'Calgary', 'Alberta', 'T3H4M1', 'Jamie Houses You Suites', 5, 4, 13),
    (14, 2, 9041, 'Cedar Drive', 'Ottawa', 'Ontario', 'K1A0B1', 'Jamie Houses You Inn', 5, 1, 14),
    (15, 2, 276, 'Birch Road', 'Halifax', 'Nova Scotia', 'B3H2Y5', 'Jamie Houses You Plaza', 6, 3, 15),
    (16, 2, 611, 'Spruce Avenue', 'Winnipeg', 'Manitoba', 'R3C4T3', 'Jamie Houses You Comfort', 5, 5, 16),
    (17, 2, 83, 'Willow Way', 'Quebec City', 'Quebec', 'G1A7K2', 'Jamie Houses You Grand', 6, 2, 17),
    (18, 3, 451, 'Aspen Trail', 'Edmonton', 'Alberta', 'T5J3N6', 'Edmonton Best Suites', 5, 4, 18),
    (19, 3, 92, 'Raven Road', 'Calgary', 'Alberta', 'T2P1J9', 'Edmonton Best Inn', 5, 2, 19),
    (20, 3, 7803, 'Lakeshore Drive', 'Vancouver', 'British Columbia', 'V6B2K4', 'Edmonton Best Waterfront', 5, 5, 20),
    (21, 3, 134, 'Sunset Boulevard', 'Vancouver', 'British Columbia', 'V8W1P6', 'Edmonton Best Retreat', 5, 3, 21),
    (22, 3, 667, 'Highland Street', 'Saskatoon', 'Saskatchewan', 'S7K4A2', 'Edmonton Best Lodge', 5, 1, 22),
    (23, 3, 2895, 'Riverbend Avenue', 'Regina', 'Saskatchewan', 'S4P3X1', 'Edmonton Best Plaza', 5, 4, 23),
    (24, 3, 76, 'Elm Street', 'Toronto', 'Ontario', 'M5V2T6', 'Edmonton Best Downtown', 5, 2, 24),
    (25, 3, 908, 'Granite Lane', 'Halifax', 'Nova Scotia', 'B3J1S9', 'Edmonton Best Harbour', 5, 5, 25),
    (26, 4, 312, 'Rosewood Drive', 'Montreal', 'Quebec', 'H3Z2Y7', 'Chateau Royale', 5, 3, 26),
    (27, 4, 8457, 'Kingfisher Lane', 'Ottawa', 'Ontario', 'K2P1L4', 'Chateau Grand', 5, 5, 27),
    (28, 4, 59, 'Harbour Street', 'Vancouver', 'British Columbia', 'V6C3R2', 'Chateau Waterfront', 5, 4, 28),
    (29, 4, 706, 'Summit Avenue', 'Calgary', 'Alberta', 'T2N1X8', 'Chateau Heights', 5, 2, 29),
    (30, 4, 1482, 'Meadow Lane', 'Winnipeg', 'Manitoba', 'R3L0K5', 'Chateau Meadow', 5, 1, 30),
    (31, 4, 233, 'Oceanview Drive', 'Halifax', 'Nova Scotia', 'B3K5M9', 'Chateau Ocean', 5, 3, 31),
    (32, 4, 977, 'Canyon Road', 'Edmonton', 'Alberta', 'T6H2V1', 'Chateau Canyon', 5, 4, 32),
    (33, 4, 64, 'Parkside Avenue', 'Ottawa', 'Ontario', 'M4W2N6', 'Chateau Park', 5, 2, 33),
    (34, 4, 5210, 'Riverstone Street', 'Saskatoon', 'Saskatchewan', 'S7H3Z4', 'Chateau Riverstone', 5, 5, 34),
    (35, 4, 187, 'Golden Mile Road', 'Victoria', 'British Columbia', 'V8V1A3', 'Chateau Golden', 5, 1, 35),
    (36, 5, 214, 'Silver Birch Lane', 'Toronto', 'Ontario', 'M5B2H1', 'Alexander Suites', 5, 3, 36),
    (37, 5, 8793, 'Crystal Avenue', 'Vancouver', 'British Columbia', 'V5T1X4', 'Alexander Grand', 5, 5, 37),
    (38, 5, 61, 'Harborview Road', 'Halifax', 'Nova Scotia', 'B3H4R2', 'Alexander Harbour', 5, 2, 38),
    (39, 5, 502, 'Evergreen Terrace', 'Calgary', 'Alberta', 'T3E6K7', 'Alexander Retreat', 5, 4, 39),
    (40, 5, 1907, 'Stonegate Drive', 'Ottawa', 'Ontario', 'K1P5L6', 'Alexander Plaza', 5, 1, 40),
    (41, 5, 333, 'Lakeside Boulevard', 'Winnipeg', 'Manitoba', 'R3B1C2', 'Alexander Lakeside', 5, 3, 41),
    (42, 5, 72, 'Hillcrest Avenue', 'Calgary', 'Alberta', 'T5K2N8', 'Alexander Heights', 5, 5, 42),
    (43, 5, 6481, 'Crescent Road', 'Quebec City', 'Quebec', 'G1R4P5', 'Alexander Crescent', 5, 2, 43);

insert into hotel_contact_phone(hotel_phone, hotel_id)
    values(8328967382, 1), (3651737537, 1), (2648238536, 2), (3346287598, 2), (35829664736, 2), (6141264927, 3), (2579362536, 4), (1232567891, 4), (36483457256, 5), (1254788789, 5), (9876543210, 6), (12345678901, 6), (5647382910, 6), (9182736455, 7), (1029384756, 7), (7463829105, 7), (5551234567, 7), (2233445566, 8), (6677889900, 8), (99887766554, 8), (1112223334, 8), (4445556667, 8), (7894561230, 9), (3216549870, 9), (8527419630, 9), (96385274125, 9), (1472583690, 9), (3692581470, 10), (2581473690, 10), (7418529630, 10), (8529637410, 10), (1593574862, 11), (7531598426, 11), (95135786420, 11), (4561237890, 12), (7890123456, 12), (2345678901, 13), (8901234567, 13), (5678901234, 13), (3456789012, 13), (6789012345, 14), (9012345678, 15), (2109876543, 15), (4321098765, 15), (7654321098, 16), (8765432109, 16), (1357924680, 17), (2468135790, 17), (11223344556, 17), (9988665544, 18), (8877554433, 18), (7766443322, 18), (6655332211, 18), (5544221100, 19), (10293847561, 20), (56473829105, 20), (9182736450, 21), (1928374650, 21), (5647382910, 21), (8372619450, 22), (7261594830, 22), (6159483720, 23), (5048372610, 23), (4937261500, 23), (3826150490, 24), (2715049380, 24), (1604938270, 25), (1493827160, 25), (1382716050, 25), (1271605940, 25), (1160493820, 26), (1059382710, 27), (1948271600, 27), (2837160590, 28), (3726059480, 28), (4615948370, 28), (5504837260, 29), (6393726150, 30), (7282615040, 30), (8171504930, 30), (9060493820, 31), (9959382710, 31), (8848271600, 32), (7737160590, 32), (6626059480, 32), (5515948370, 33), (4404837260, 34), (3293726150, 34), (2182615040, 34), (1071504930, 35), (1960493820, 35), (2859382710, 36), (3748271600, 36), (4637160590, 36), (5526059480, 37), (6415948370, 38), (7304837260, 38), (8193726150, 38), (9082615040, 39), (9971504930, 39), (8860493820, 40), (7759382710, 40), (6648271600, 40), (5537160590, 41), (4426059480, 42), (3315948370, 42), (2204837260, 42), (1193726150, 43), (1082615040, 43);

insert into hotel_contact_email(hotel_email, hotel_id)
    values('contact@starringhotel.com', 1), ('info@starringhotel.com', 1), ('hello@starzhotel.com', 2), ('contact@etoilehotel.com', 3), ('info@etoilehotel.com', 3), ('stay@starryhotel.com', 4), ('hello@starryhotel.com', 4), ('contact@starshothotel.com', 5), ('info@starshothotel.com', 5), ('reservations@starshothotel.com', 5), ('stay@starshothotel.com', 5), ('hello@starshothotel.com', 5), ('contact@pictonstarhotel.com', 6), ('info@stargazershotel.com', 7), ('reservations@stargazershotel.com', 7), ('contact@stardomehotel.com', 8), ('info@stardomehotel.com', 8), ('reservations@stardomehotel.com', 8), ('contact@jamieshotel.com', 9), ('info@jamieshotel.com', 9), ('contact@jamjamhotel.com', 10), ('info@jamjamhotel.com', 10), ('reservations@jamjamhotel.com', 10), ('contact@jamiehousinghotel.com', 11), ('contact@jamiehousesyoudowntown.com', 12), ('info@jamiehousesyoudowntown.com', 12), ('contact@jamiehousesyousuites.com', 13), ('info@jamiehousesyousuites.com', 13), ('reservations@jamiehousesyousuites.com', 13), ('contact@jamiehousesyouinn.com', 14), ('contact@jamiehousesyouplaza.com', 15), ('info@jamiehousesyouplaza.com', 15), ('contact@jamiehousesyoucomfort.com', 16), ('info@jamiehousesyoucomfort.com', 16), ('reservations@jamiehousesyoucomfort.com', 16), ('contact@jamiehousesyougrand.com', 17), ('contact@edmontonbestsuites.com', 18), ('info@edmontonbestsuites.com', 18), ('reservations@edmontonbestsuites.com', 18), ('stay@edmontonbestsuites.com', 18), ('hello@edmontonbestsuites.com', 18), ('contact@edmontonbestinn.com', 19), ('info@edmontonbestinn.com', 19), ('contact@edmontonbestwaterfront.com', 20), ('info@edmontonbestwaterfront.com', 20), ('reservations@edmontonbestwaterfront.com', 20), ('contact@edmontonbestretreat.com', 21), ('contact@edmontonbestlodge.com', 22), ('info@edmontonbestlodge.com', 22), ('contact@edmontonbestplaza.com', 23), ('info@edmontonbestplaza.com', 23), ('reservations@edmontonbestplaza.com', 23), ('contact@edmontonbestdowntown.com', 24), ('contact@edmontonbestharbour.com', 25), ('info@edmontonbestharbour.com', 25), ('contact@chateauroyale.com', 26), ('info@chateauroyale.com', 26), ('reservations@chateauroyale.com', 26), ('contact@chateaugrand.com', 27), ('contact@chateauwaterfront.com', 28), ('info@chateauwaterfront.com', 28), ('contact@chateauheights.com', 29), ('info@chateauheights.com', 29), ('reservations@chateauheights.com', 29), ('contact@chateaumeadow.com', 30), ('contact@chateauocean.com', 31), ('info@chateauocean.com', 31), ('contact@chateaucanyon.com', 32), ('info@chateaucanyon.com', 32), ('reservations@chateaucanyon.com', 32), ('contact@chateaupark.com', 33), ('contact@chateauriverstone.com', 34), ('info@chateauriverstone.com', 34), ('contact@chateaugolden.com', 35), ('info@chateaugolden.com', 35), ('reservations@chateaugolden.com', 35), ('contact@alexandersuites.com', 36), ('contact@alexandergrand.com', 37), ('info@alexandergrand.com', 37), ('contact@alexanderharbour.com', 38), ('info@alexanderharbour.com', 38), ('reservations@alexanderharbour.com', 38), ('contact@alexanderretreat.com', 39), ('contact@alexanderplaza.com', 40), ('info@alexanderplaza.com', 40), ('contact@alexanderlakeside.com', 41), ('info@alexanderlakeside.com', 41), ('reservations@alexanderlakeside.com', 41), ('contact@alexanderheights.com', 42), ('contact@alexandercrescent.com', 43), ('info@alexandercrescent.com', 43);


--quick way to randomize data and add lots of rooms
INSERT INTO Room (hotel_id, room_number, price, capacity, view_type, extendable, damages)
    SELECT
        h.hotel_id,
        gs.room_number,
        
        -- price
        (
            75
            + (h.star_rating * 20)
            + (gs.room_number * 15)
            + ((h.hotel_id % 5) * 7)
        )::DECIMAL(10,2) AS price,

        -- capacity
        CASE
            WHEN gs.room_number % 5 = 1 THEN 1
            WHEN gs.room_number % 5 = 2 THEN 2
            WHEN gs.room_number % 5 = 3 THEN 3
            WHEN gs.room_number % 5 = 4 THEN 4
            ELSE 5
        END AS capacity,

        -- view_type
        CASE
            WHEN (h.hotel_id + gs.room_number) % 2 = 0 THEN 'Sea'
            ELSE 'Mountain'
        END AS view_type,

        -- extendable
        CASE
            WHEN
                CASE
                    WHEN gs.room_number % 5 = 1 THEN 1
                    WHEN gs.room_number % 5 = 2 THEN 2
                    WHEN gs.room_number % 5 = 3 THEN 3
                    WHEN gs.room_number % 5 = 4 THEN 4
                    ELSE 5
                END = 1
            THEN FALSE
            ELSE ((h.hotel_id + gs.room_number) % 2 = 0)
        END AS extendable,

        -- damages
        ((h.hotel_id * gs.room_number) % 4 = 0) AS damages

    FROM Hotel h
    CROSS JOIN LATERAL generate_series(1, h.num_of_rooms) AS gs(room_number)
    ORDER BY h.hotel_id, gs.room_number;

-- quick way to randomize amenity data 
INSERT INTO amenity (hotel_id, room_number, amenity)

    SELECT
        r.hotel_id,
        r.room_number,
        a.amenity
    FROM Room r
    CROSS JOIN (
        VALUES 
            ('TV'),
            ('AC'),
            ('WiFi'),
            ('Fridge'),
            ('Microwave'),
            ('Iron')
    ) AS a(amenity)
    WHERE random() < 0.7;  -- 70% chance each amenity is included

-- only 3 employees for first 10 hotels
INSERT INTO employee (
        employee_ssn, hotel_id, first_name, last_name,
        street_number, street_name, city, province, zip
    )
    VALUES
    -- Hotel 1
    (100000001,1,'John','Smith',10,'Maple Street','Kingston','Ontario','K1A1A1'),
    (100000002,1,'Emma','Brown',22,'Oak Avenue','Kingston','Ontario','K1A1A2'),
    (100000003,1,'Liam','Davis',35,'Pine Road','Kingston','Ontario','K1A1A3'),

    -- Hotel 2
    (100000004,2,'Noah','Wilson',12,'Birch Street','Ottawa','Ontario','K1B1B1'),
    (100000005,2,'Olivia','Taylor',44,'Cedar Avenue','Ottawa','Ontario','K1B1B2'),
    (100000006,2,'Ava','Anderson',78,'Elm Street','Ottawa','Ontario','K1B1B3'),

    -- Hotel 3
    (100000007,3,'Sophia','Thomas',9,'Willow Road','Montreal','Quebec','H1A1A1'),
    (100000008,3,'Mason','Jackson',18,'Ash Street','Montreal','Quebec','H1A1A2'),
    (100000009,3,'Isabella','White',50,'Spruce Ave','Montreal','Quebec','H1A1A3'),

    -- Hotel 4
    (100000010,4,'James','Harris',33,'Lake Street','Quebec City','Quebec','G1A1A1'),
    (100000011,4,'Mia','Martin',21,'Hill Road','Quebec City','Quebec','G1A1A2'),
    (100000012,4,'Lucas','Thompson',64,'Forest Ave','Quebec City','Quebec','G1A1A3'),

    -- Hotel 5
    (100000013,5,'Amelia','Garcia',11,'River Road','Brock','Ontario','L1A1A1'),
    (100000014,5,'Ethan','Martinez',25,'Sunset Blvd','Brock','Ontario','L1A1A2'),
    (100000015,5,'Harper','Robinson',42,'Park Lane','Brock','Ontario','L1A1A3'),

    -- Hotel 6
    (100000016,6,'Benjamin','Clark',19,'Main Street','Picton','Ontario','K0K1A1'),
    (100000017,6,'Charlotte','Rodriguez',55,'Queen Street','Picton','Ontario','K0K1A2'),
    (100000018,6,'Henry','Lewis',71,'Victoria Ave','Picton','Ontario','K0K1A3'),

    -- Hotel 7
    (100000019,7,'Elijah','Lee',14,'Garden Street','Gatineau','Quebec','J8X1A1'),
    (100000020,7,'Evelyn','Walker',28,'Bridge Road','Gatineau','Quebec','J8X1A2'),
    (100000021,7,'Alexander','Hall',63,'Valley Ave','Gatineau','Quebec','J8X1A3'),

    -- Hotel 8
    (100000022,8,'Daniel','Allen',7,'Hillcrest','Ottawa','Ontario','K2A1A1'),
    (100000023,8,'Abigail','Young',39,'Park Ave','Ottawa','Ontario','K2A1A2'),
    (100000024,8,'Matthew','King',81,'Riverbank','Ottawa','Ontario','K2A1A3'),

    -- Hotel 9
    (100000025,9,'Joseph','Wright',16,'Lakeshore','Montreal','Quebec','H2B1B1'),
    (100000026,9,'Emily','Scott',29,'Mountain Rd','Montreal','Quebec','H2B1B2'),
    (100000027,9,'David','Green',53,'Central Ave','Montreal','Quebec','H2B1B3'),

    -- Hotel 10
    (100000028,10,'Samuel','Adams',20,'Forest Lane','Toronto','Ontario','M1A1A1'),
    (100000029,10,'Ella','Baker',36,'King Street','Toronto','Ontario','M1A1A2'),
    (100000030,10,'Michael','Nelson',60,'Queen Ave','Toronto','Ontario','M1A1A3');

-- employee positions only for 30 employees prev created
INSERT INTO employee_position (employee_ssn, hotel_id, position)
    VALUES
    -- Hotel 1
    (100000001,1,'Front desk agent'),
    (100000002,1,'Housekeeper'),
    (100000003,1,'Security'),

    -- Hotel 2
    (100000004,2,'Concierge'),
    (100000005,2,'Cleaner'),
    (100000006,2,'Valet'),

    -- Hotel 3
    (100000007,3,'Chef'),
    (100000008,3,'Server'),
    (100000009,3,'Bartender'),

    -- Hotel 4
    (100000010,4,'Maintenance'),
    (100000011,4,'Housekeeper'),
    (100000012,4,'Front desk agent'),

    -- Hotel 5
    (100000013,5,'Security'),
    (100000014,5,'Concierge'),
    (100000015,5,'Cleaner'),

    -- Hotel 6
    (100000016,6,'Chef'),
    (100000017,6,'Server'),
    (100000018,6,'Bartender'),

    -- Hotel 7
    (100000019,7,'Doorman'),
    (100000020,7,'Valet'),
    (100000021,7,'Security'),

    -- Hotel 8
    (100000022,8,'Front desk agent'),
    (100000023,8,'Housekeeper'),
    (100000024,8,'Maintenance'),

    -- Hotel 9
    (100000025,9,'Chef'),
    (100000026,9,'Server'),
    (100000027,9,'Bartender'),

    -- Hotel 10
    (100000028,10,'Concierge'),
    (100000029,10,'Cleaner'),
    (100000030,10,'Valet');

--inserting managers, picking the first employee from each hotel
INSERT INTO Manages (hotel_id, employee_ssn)
    VALUES
    (1,100000001),
    (2,100000004),
    (3,100000007),
    (4,100000010),
    (5,100000013),
    (6,100000016),
    (7,100000019),
    (8,100000022),
    (9,100000025),
    (10,100000028);

--adding rentings and bookings
insert into renting_booking (hotel_id, room_number, customer_id, renting_booking_id, checkin_date, checkout_date, employee_responable, booking, booking_date)
values 
(1, )

--NEED TO CREATE CUSTOMERS, THEN TEST INSERTION DATA