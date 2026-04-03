package com.example.dao;

import com.example.model.Room;

import java.sql.*;
import java.util.*;

public class RoomDAO {

    public List<Room> searchAvailableRooms(int capacity) {

        List<Room> rooms = new ArrayList<>();

        String sql = "SELECT * FROM room WHERE capacity = ?";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, capacity);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {

                Room r = new Room();

                r.setId(rs.getInt("id"));
                r.setHotelId(rs.getInt("hotel_id"));
                r.setPrice(rs.getDouble("price"));
                r.setCapacity(rs.getInt("capacity"));

                rooms.add(r);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return rooms;
    }
}