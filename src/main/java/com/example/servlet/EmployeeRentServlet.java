package com.example.servlet;

import com.example.dao.BookingDAO;
import com.example.model.Booking;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.WebServlet;

import java.io.IOException;
import java.time.LocalDate;

@WebServlet("/employee/rentRoom")
public class EmployeeRentServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            Booking b = new Booking();

            b.setCustomerId(Integer.parseInt(request.getParameter("customerId")));
            b.setHotelId(Integer.parseInt(request.getParameter("hotelId")));
            b.setRoomNumber(Integer.parseInt(request.getParameter("roomNumber")));

            b.setCheckinDate(LocalDate.parse(request.getParameter("checkin")));
            b.setCheckoutDate(LocalDate.parse(request.getParameter("checkout")));

            b.setBooking(true);
            b.setEmployeeResponsable(Integer.parseInt(request.getParameter("employeeId")));

            BookingDAO dao = new BookingDAO();
            String result = dao.insertBooking(b);

            if (result == null) {
                response.sendRedirect(request.getContextPath()
                        + "/employee/rentRoom.jsp?msg=success");
            } else {
                System.out.println(result);
                response.sendRedirect(request.getContextPath()
                        + "/employee/rentRoom.jsp?msg=error");
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect(request.getContextPath()
                    + "/employee/rentRoom.jsp?msg=error");
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("/employee/rentRoom.jsp").forward(request, response);
    }
}