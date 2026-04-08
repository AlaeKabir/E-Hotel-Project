package com.example.servlet;

import com.example.dao.BookingDAO;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import jakarta.servlet.*;

import java.io.IOException;

@WebServlet("/employee/checkIn")
public class CheckInServlet extends HttpServlet {

    private BookingDAO bookingDAO = new BookingDAO();

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int bookingId = Integer.parseInt(request.getParameter("bookingId"));

        bookingDAO.convertToRenting(bookingId);

        response.sendRedirect(request.getContextPath() + "/employee/viewBookings");
    }
}