INSERT INTO hotel_chain (name, central_address)
VALUES ('Hilton Group', 'New York');

INSERT INTO hotel (chain_id, hotel_name, category, area, total_rooms)
VALUES (1, 'Hilton Ottawa', 4, 'Ottawa', 100);

INSERT INTO room (hotel_id, price, capacity, view_type)
VALUES
(1, 120, 'Single', 'City'),
(1, 180, 'Double', 'City'),
(1, 250, 'Suite', 'City');
