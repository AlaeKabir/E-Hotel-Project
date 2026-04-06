package com.example.model;

import java.time.LocalDate;

public class Booking {

    private int rentingBookingId;
    private int hotelId;
    private int roomNumber;
    private int customerId;
    private int employeeResponsable;
    private LocalDate checkinDate;
    private LocalDate checkoutDate;
    private boolean booking;
    private LocalDate bookingDate;

    public Booking() {}

    public int getRentingBookingId() { return rentingBookingId; }
    public void setRentingBookingId(int rentingBookingId) { this.rentingBookingId = rentingBookingId; }

    public int getHotelId() { return hotelId; }
    public void setHotelId(int hotelId) { this.hotelId = hotelId; }

    public int getRoomNumber() { return roomNumber; }
    public void setRoomNumber(int roomNumber) { this.roomNumber = roomNumber; }

    public int getCustomerId() { return customerId; }
    public void setCustomerId(int customerId) { this.customerId = customerId; }

    public int getEmployeeResponsable() { return employeeResponsable; }
    public void setEmployeeResponsable(int employeeResponsable) { this.employeeResponsable = employeeResponsable; }

    public LocalDate getCheckinDate() { return checkinDate; }
    public void setCheckinDate(LocalDate checkinDate) { this.checkinDate = checkinDate; }

    public LocalDate getCheckoutDate() { return checkoutDate; }
    public void setCheckoutDate(LocalDate checkoutDate) { this.checkoutDate = checkoutDate; }

    public boolean isBooking() { return booking; }
    public void setBooking(boolean booking) { this.booking = booking; }

    public LocalDate getBookingDate() { return bookingDate; }
    public void setBookingDate(LocalDate bookingDate) { this.bookingDate = bookingDate; }
}