package com.example.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.example.model.Room;

public class RoomDAO {

    public List<Room> searchRooms(String area, String chain, String category,
                                  int capacity, double price) {

        List<Room> rooms = new ArrayList<>();

        try (Connection conn = DBConnection.getConnection()) {

            // Base SQL
            String sql =
                "SELECT r.* FROM room r " +
                "JOIN hotel h ON r.hotel_id = h.hotel_id " +
                "JOIN hotel_chain c ON h.hotel_chain_id = c.hotel_chain_id " +
                "WHERE 1=1";

            // List to store parameters for PreparedStatement
            List<Object> params = new ArrayList<>();

            // Optional filters
            if (area != null && !area.isEmpty()) {
                sql += " AND h.address LIKE ?";
                params.add("%" + area + "%");
            }

            if (capacity > 0) {
                sql += " AND r.capacity >= ?";
                params.add(capacity);
            }

            if (price > 0) {
                sql += " AND r.price <= ?";
                params.add(price);
            }

            if (category != null && !category.isEmpty()) {
                sql += " AND h.category = ?";
                params.add(category);
            }

            if (chain != null && !chain.isEmpty()) {
                sql += " AND c.name = ?";
                params.add(chain);
            }

            // Prepare statement
            PreparedStatement ps = conn.prepareStatement(sql);

            // Set parameters dynamically
            for (int i = 0; i < params.size(); i++) {
                ps.setObject(i + 1, params.get(i));
            }

            // Execute query
            ResultSet rs = ps.executeQuery();

            // Map results to Room objects
            while (rs.next()) {
                Room r = new Room();
                r.setId(rs.getInt("id"));
                r.setHotelId(rs.getInt("hotel_id"));
                r.setCapacity(rs.getInt("capacity"));
                r.setPrice(rs.getDouble("price"));
                rooms.add(r);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return rooms;
    }
}