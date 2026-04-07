UPDATE renting_booking
SET
    booking = FALSE,
    booking_date = NULL
WHERE
    renting_booking_id = 1
    AND booking = TRUE;