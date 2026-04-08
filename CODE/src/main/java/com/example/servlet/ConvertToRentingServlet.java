package com.example.servlet;

import java.io.IOException;

import com.example.dao.BookingDAO;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/convertToRenting")
public class ConvertToRentingServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String idParam         = request.getParameter("rentingBookingId");
        String customerIdParam = request.getParameter("customerId");

        try {
            int rentingBookingId = Integer.parseInt(idParam);
            int customerId       = Integer.parseInt(customerIdParam);

            BookingDAO dao = new BookingDAO();
            String error = dao.convertToRenting(rentingBookingId);

            if (error != null) {
                request.setAttribute("error", error);
            } else {
                request.setAttribute("success", "Booking #" + rentingBookingId + " converted to renting.");
            }

            request.setAttribute("bookings", dao.getBookingsByCustomer(customerId));
            request.setAttribute("customerId", customerId);

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Invalid booking ID.");
        }

        request.getRequestDispatcher("/employee/viewBookings.jsp").forward(request, response);
    }
}