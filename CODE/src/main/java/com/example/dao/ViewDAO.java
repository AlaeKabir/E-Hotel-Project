package com.example.dao;

import java.sql.*;
import java.util.*;

public class ViewDAO {

    public List<String> getAvailableRoomsPerArea() {
        List<String> list = new ArrayList<>();

        String sql = "SELECT city, province, available_rooms FROM available_rooms_per_area";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                String city = rs.getString("city");
                String province = rs.getString("province");
                int rooms = rs.getInt("available_rooms");

                list.add(city + ", " + province + " → " + rooms + " available rooms");
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    public List<String> getHotelCapacity() {
        List<String> list = new ArrayList<>();

        String sql = "SELECT hotel_name, total_capacity FROM hotel_total_capacity";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                String name = rs.getString("hotel_name");
                int capacity = rs.getInt("total_capacity");

                list.add(name + " → Capacity: " + capacity);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }
}