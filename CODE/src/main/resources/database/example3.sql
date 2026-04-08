SELECT COUNT(*) FROM room r
JOIN hotel h ON r.hotel_id = h.hotel_id
WHERE h.city ILIKE '%Montreal%'
AND NOT EXISTS (
    SELECT 1 FROM renting_booking rb
    WHERE rb.hotel_id    = r.hotel_id
      AND rb.room_number = r.room_number
      AND rb.checkin_date  < '2026-09-01'::date
      AND rb.checkout_date > '2026-08-01'::date
);