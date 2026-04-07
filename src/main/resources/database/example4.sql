SELECT r.*, h.hotel_name
FROM room r
JOIN hotel h ON r.hotel_id = h.hotel_id
JOIN hotel_chain c ON h.hotel_chain_id = c.hotel_chain_id
WHERE h.city ILIKE '%Ottawa%'
  AND h.star_rating = 5
  AND r.capacity >= 2
  AND r.price <= 300
  AND r.view_type = 'Sea'
  AND NOT EXISTS (
      SELECT 1 FROM renting_booking rb
      WHERE rb.hotel_id    = r.hotel_id
        AND rb.room_number = r.room_number
        AND rb.checkin_date  < '2026-06-30'::date
        AND rb.checkout_date > '2026-06-01'::date
  )
  AND h.num_of_rooms >= 5
  AND r.extendable = TRUE;