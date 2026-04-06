package com.example.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.example.model.Room;

public class ViewDAO {

    public List<Room> getAvailableRooms() {

        List<Room> rooms = new ArrayList<>();

        String sql =
            "SELECT r.* FROM room r " +
            "JOIN hotel h ON r.hotel_id = h.hotel_id " +
            "WHERE NOT EXISTS (" +
            "  SELECT 1 FROM renting_booking rb" +
            "  WHERE rb.hotel_id    = r.hotel_id" +
            "    AND rb.room_number = r.room_number" +
            "    AND rb.checkin_date  <= CURRENT_DATE" +
            "    AND rb.checkout_date >  CURRENT_DATE" +
            ")";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                Room r = new Room();
                r.setHotelId(rs.getInt("hotel_id"));
                r.setRoomNumber(rs.getInt("room_number"));
                r.setPrice(rs.getDouble("price"));
                r.setCapacity(rs.getInt("capacity"));
                r.setViewType(rs.getString("view_type"));
                r.setExtendable(rs.getBoolean("extendable"));
                r.setDamages(rs.getBoolean("damages"));
                rooms.add(r);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return rooms;
    }
}