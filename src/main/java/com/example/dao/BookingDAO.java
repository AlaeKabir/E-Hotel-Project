package com.example.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Types;
import java.time.LocalDate;

import com.example.model.Booking;

public class BookingDAO {

    public String convertToRenting(int rentingBookingId) {
        String sql = "UPDATE renting_booking " +
                    "SET booking = FALSE, booking_date = NULL " +
                    "WHERE renting_booking_id = ? AND booking = TRUE";
        try (Connection conn = DBConnection.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, rentingBookingId);
            int rows = ps.executeUpdate();
            if (rows == 0) return "Booking not found or already a renting.";
            return null; 
        } catch (SQLException e) {
            e.printStackTrace();
            return "Failed to convert booking: " + e.getMessage();
        }
    }


    public String insertBooking(Booking b) {
        String sql = "INSERT INTO renting_booking " +
                     "(hotel_id, room_number, customer_id, renting_booking_id, " +
                     " checkin_date, checkout_date, employee_responsable, booking, booking_date) " +
                     "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, b.getHotelId());
            ps.setInt(2, b.getRoomNumber());
            ps.setInt(3, b.getCustomerId());
            ps.setInt(4, getNextBookingId(conn));
            ps.setDate(5, Date.valueOf(b.getCheckinDate()));
            ps.setDate(6, Date.valueOf(b.getCheckoutDate()));
            ps.setInt(7, b.getEmployeeResponsable());
            ps.setBoolean(8, b.isBooking());

            if (b.isBooking()) {
                ps.setDate(9, Date.valueOf(LocalDate.now()));
            } else {
                ps.setNull(9, Types.DATE);
            }

            ps.executeUpdate();
            return null; 
        } catch (SQLException e) {
            String msg = e.getMessage();

            if (msg != null && msg.contains("checkin_date") && msg.contains("cannot be before today")) {
                return "Check-in date cannot be in the past. Please select a future date.";
            }
            if (msg != null && msg.contains("already has a renting during the selected date range")) {
                return "This room is already booked for the selected dates. Please choose different dates.";
            }

            e.printStackTrace();
            return "Booking failed due to an unexpected error. Please try again.";
        }
    }

    private int getNextBookingId(Connection conn) throws SQLException {
        String sql = "SELECT COALESCE(MAX(renting_booking_id), 0) + 1 FROM renting_booking";
        try (PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            return rs.next() ? rs.getInt(1) : 1;
        }
    }

    public java.util.List<Booking> getBookingsByCustomer(int customerId) {
        java.util.List<Booking> list = new java.util.ArrayList<>();
        String sql = "SELECT * FROM renting_booking WHERE customer_id = ? ORDER BY checkin_date DESC";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, customerId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Booking b = new Booking();
                b.setRentingBookingId(rs.getInt("renting_booking_id"));
                b.setHotelId(rs.getInt("hotel_id"));
                b.setRoomNumber(rs.getInt("room_number"));
                b.setCustomerId(rs.getInt("customer_id"));
                b.setCheckinDate(rs.getDate("checkin_date").toLocalDate());
                b.setCheckoutDate(rs.getDate("checkout_date").toLocalDate());
                b.setBooking(rs.getBoolean("booking"));
                Date bd = rs.getDate("booking_date");
                if (bd != null) b.setBookingDate(bd.toLocalDate());
                list.add(b);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public void convertToRenting(int bookingId) {
        String sql = "UPDATE renting_booking SET booking = false, booking_date = NULL WHERE renting_booking_id = ?";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, bookingId);
            ps.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}