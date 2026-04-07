package com.example.servlet;

import com.example.dao.BookingDAO;
import com.example.model.Booking;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.util.List;

@WebServlet("/employee/viewBookings")
public class EmployeeViewBookingsServlet extends HttpServlet {

    private BookingDAO bookingDAO = new BookingDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            int customerId = 100000031;

            List<Booking> bookings = bookingDAO.getBookingsByCustomer(customerId);

            request.setAttribute("bookings", bookings);

            request.getRequestDispatcher("/employee/viewBookings.jsp")
                    .forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Error loading bookings");
            request.getRequestDispatcher("/employee/viewBookings.jsp")
                    .forward(request, response);
        }
    }
}