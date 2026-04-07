SELECT hotel_id, room_number
FROM room r
WHERE
    price = (
        SELECT MAX(price)
        FROM room r2
        WHERE
            r2.hotel_id = r.hotel_id
    );