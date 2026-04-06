package com.example.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import com.example.model.Room;

public class RoomDAO {
    
    //Nested Requirement
    public Set<String> getMostExpensiveRooms() {
        Set<String> keys = new HashSet<>();
        String sql =
            "SELECT hotel_id, room_number FROM room r " +
            "WHERE price = (" +
            "  SELECT MAX(price) FROM room r2 " +
            "  WHERE r2.hotel_id = r.hotel_id" +
            ")";
        try (Connection conn = DBConnection.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                keys.add(rs.getInt("hotel_id") + "-" + rs.getInt("room_number"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return keys;
    }

    //Aggregation requirement
    public int getAvailableRoomsInCity(String city, String startDate, String endDate) {
        String sql =
            "SELECT COUNT(*) FROM room r " +
            "JOIN hotel h ON r.hotel_id = h.hotel_id " +
            "WHERE h.city ILIKE ? " +
            "AND NOT EXISTS (" +
            "  SELECT 1 FROM renting_booking rb" +
            "  WHERE rb.hotel_id    = r.hotel_id" +
            "    AND rb.room_number = r.room_number" +
            "    AND rb.checkin_date  < ?::date" +
            "    AND rb.checkout_date > ?::date" +
            ")";
        try (Connection conn = DBConnection.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, "%" + city + "%");
            ps.setString(2, endDate != null && !endDate.isEmpty() ? endDate : "9999-12-31");
            ps.setString(3, startDate != null && !startDate.isEmpty() ? startDate : "1900-01-01");
            ResultSet rs = ps.executeQuery();
            if (rs.next()) return rs.getInt(1);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0;
    }

    public List<Room> searchRooms(String city, String chain, int starRating,
                               int capacity, double price,
                               String viewType, String startDate, String endDate, int minHotelRooms, String extendable) {

    List<Room> rooms = new ArrayList<>();

    try (Connection conn = DBConnection.getConnection()) {

        String sql =
            "SELECT r.*, h.hotel_name FROM room r " +
            "JOIN hotel h ON r.hotel_id = h.hotel_id " +
            "JOIN hotel_chain c ON h.hotel_chain_id = c.hotel_chain_id " +
            "WHERE 1=1";

        List<Object> params = new ArrayList<>();

        if (city != null && !city.isEmpty()) {
            sql += " AND h.city ILIKE ?";
            params.add("%" + city + "%");
        }

        if (chain != null && !chain.isEmpty()) {
            sql += " AND c.hotel_chain_name ILIKE ?";
            params.add("%" + chain + "%");
        }

        if (starRating > 0) {
            sql += " AND h.star_rating = ?";
            params.add(starRating);
        }

        if (capacity > 0) {
            sql += " AND r.capacity >= ?";
            params.add(capacity);
        }

        if (price > 0) {
            sql += " AND r.price <= ?";
            params.add(price);
        }

        if (viewType != null && !viewType.isEmpty()) {
            sql += " AND r.view_type = ?";
            params.add(viewType);
        }

        if (startDate != null && !startDate.isEmpty() &&
            endDate   != null && !endDate.isEmpty()) {
            sql += " AND NOT EXISTS (" +
                   "  SELECT 1 FROM renting_booking rb" +
                   "  WHERE rb.hotel_id    = r.hotel_id" +
                   "    AND rb.room_number = r.room_number" +
                   "    AND rb.checkin_date  < ?::date" +
                   "    AND rb.checkout_date > ?::date" +
                   ")";
            params.add(endDate);
            params.add(startDate);
        }
        
        if (minHotelRooms > 0) {
            sql += " AND h.num_of_rooms >= ?";
            params.add(minHotelRooms);
        }

        if (extendable != null && extendable.equals("true")) {
            sql += " AND r.extendable = TRUE";
        }
        
        PreparedStatement ps = conn.prepareStatement(sql);
        for (int i = 0; i < params.size(); i++) {
            ps.setObject(i + 1, params.get(i));
        }

        ResultSet rs = ps.executeQuery();

        while (rs.next()) {
            Room r = new Room();
            r.setHotelId(rs.getInt("hotel_id"));
            r.setRoomNumber(rs.getInt("room_number"));
            r.setPrice(rs.getDouble("price"));
            r.setCapacity(rs.getInt("capacity"));
            r.setViewType(rs.getString("view_type"));
            r.setExtendable(rs.getBoolean("extendable"));
            r.setDamages(rs.getBoolean("damages"));
            r.setHotelName(rs.getString("hotel_name"));
            rooms.add(r);
        }

    } catch (Exception e) {
        e.printStackTrace();
    }

    return rooms;
}
}