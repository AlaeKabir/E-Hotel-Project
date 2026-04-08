UPDATE renting_booking
SET
    booking = FALSE
WHERE
    renting_booking_id = 2
    AND booking = TRUE;