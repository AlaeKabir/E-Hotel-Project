package com.example.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.time.LocalDate;

import com.example.model.Customer;

public class CustomerDAO {

    //Check if customer ID exists
    public Customer getCustomerById(int customerId) {
        String sql = "SELECT * FROM customer WHERE customer_id = ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, customerId);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                Customer c = new Customer();
                c.setCustomerId(rs.getInt("customer_id"));
                c.setFirstName(rs.getString("first_name"));
                c.setLastName(rs.getString("last_name"));
                c.setStreetNumber(rs.getInt("street_number"));
                c.setStreetName(rs.getString("street_name"));
                c.setCity(rs.getString("city"));
                c.setProvince(rs.getString("province"));
                c.setZip(rs.getString("zip"));
                c.setRegistrationDate(rs.getDate("registration_date").toLocalDate());
                return c;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    //Register new customer
    public boolean registerCustomer(Customer c) {
        String sql = "INSERT INTO customer (customer_id, first_name, last_name, " +
                     "street_number, street_name, city, province, zip, registration_date) " +
                     "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, c.getCustomerId());
            ps.setString(2, c.getFirstName());
            ps.setString(3, c.getLastName());
            ps.setInt(4, c.getStreetNumber());
            ps.setString(5, c.getStreetName());
            ps.setString(6, c.getCity());
            ps.setString(7, c.getProvince());
            ps.setString(8, c.getZip());
            ps.setDate(9, Date.valueOf(LocalDate.now()));
            return ps.executeUpdate() == 1;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
}