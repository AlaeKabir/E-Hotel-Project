package com.example.dao;

import com.example.model.Room;

import java.sql.*;
import java.util.*;

public class RoomDAO {

    public List<Room> searchRooms(String area, String chain, String category,
                                  int capacity, double price) {

        List<Room> rooms = new ArrayList<>();

        String sql =
                "SELECT r.* FROM room r " +
                        "JOIN hotel h ON r.hotel_id = h.id " +
                        "JOIN hotel_chain c ON h.chain_id = c.id " +
                        "WHERE 1=1 ";

        if (area != null && !area.isEmpty())
            sql += " AND h.address LIKE '%" + area + "%'";

        if (capacity > 0)
            sql += " AND r.capacity >= " + capacity;

        if (price > 0)
            sql += " AND r.price <= " + price;

        if (category != null && !category.isEmpty())
            sql += " AND h.category = '" + category + "'";

        if (chain != null && !chain.isEmpty())
            sql += " AND c.name = '" + chain + "'";

        try (Connection conn = DBConnection.getConnection();
             Statement st = conn.createStatement();
             ResultSet rs = st.executeQuery(sql)) {

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