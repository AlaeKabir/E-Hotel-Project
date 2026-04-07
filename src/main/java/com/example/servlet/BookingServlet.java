package com.example.servlet;

import java.io.IOException;
import java.time.LocalDate;

import com.example.dao.BookingDAO;
import com.example.dao.CustomerDAO;
import com.example.model.Booking;
import com.example.model.Customer;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/bookRoom")
public class BookingServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {

        String customerIdParam = request.getParameter("customerId");

        if (customerIdParam != null) {
            int customerId = Integer.parseInt(customerIdParam);
            BookingDAO bookingDAO = new BookingDAO();
            request.setAttribute("bookings", bookingDAO.getBookingsByCustomer(customerId));
            request.setAttribute("customerId", customerId);
            request.getRequestDispatcher("/employee/viewBookings.jsp").forward(request, response);
            return;
        }

        request.setAttribute("hotelId",    request.getParameter("hotelId"));
        request.setAttribute("roomNumber", request.getParameter("roomNumber"));
        request.setAttribute("startDate",  request.getParameter("startDate"));
        request.setAttribute("endDate",    request.getParameter("endDate"));
        request.setAttribute("type",       request.getParameter("type"));
        request.getRequestDispatcher("/customer/booking.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String type      = request.getParameter("type");
        String startDate = request.getParameter("startDate");
        String endDate   = request.getParameter("endDate");
        String hotelIdStr    = request.getParameter("hotelId");
        String roomNumberStr = request.getParameter("roomNumber");

        try {
            int hotelId    = Integer.parseInt(hotelIdStr);
            int roomNumber = Integer.parseInt(roomNumberStr);
            int customerId = Integer.parseInt(request.getParameter("customerId"));
            boolean isBooking = "booking".equals(type);

            // Default employee — change to session-based later
            int employeeId = 100000001;

            // Register customer if they don't exist yet
            CustomerDAO customerDAO = new CustomerDAO();
            Customer customer = customerDAO.getCustomerById(customerId);

            if (customer == null) {
                customer = new Customer();
                customer.setCustomerId(customerId);
                customer.setFirstName(request.getParameter("firstName"));
                customer.setLastName(request.getParameter("lastName"));
                customer.setStreetNumber(Integer.parseInt(request.getParameter("streetNumber")));
                customer.setStreetName(request.getParameter("streetName"));
                customer.setCity(request.getParameter("city"));
                customer.setProvince(request.getParameter("province"));
                customer.setZip(request.getParameter("zip"));
                customerDAO.registerCustomer(customer);
            }

            Booking booking = new Booking();
            booking.setHotelId(hotelId);
            booking.setRoomNumber(roomNumber);
            booking.setCustomerId(customerId);
            booking.setCheckinDate(LocalDate.parse(startDate));
            booking.setCheckoutDate(LocalDate.parse(endDate));
            booking.setEmployeeResponsable(employeeId);
            booking.setBooking(isBooking);
            if (isBooking) booking.setBookingDate(LocalDate.now());

            BookingDAO bookingDAO = new BookingDAO();
            String error = bookingDAO.insertBooking(booking);

            if (error == null) {
                response.sendRedirect(request.getContextPath() + "/customer/confirmation.jsp" +
                        "?type=" + type +
                        "&hotelId=" + hotelId +
                        "&roomNumber=" + roomNumber +
                        "&startDate=" + startDate +
                        "&endDate=" + endDate);
            } else {
                // Re-populate attributes so the form keeps its values
                request.setAttribute("hotelId",    hotelIdStr);
                request.setAttribute("roomNumber",  roomNumberStr);
                request.setAttribute("startDate",   startDate);
                request.setAttribute("endDate",     endDate);
                request.setAttribute("type",        type);
                request.setAttribute("error",       error);
                request.getRequestDispatcher("/customer/booking.jsp").forward(request, response);
            }

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("hotelId",   hotelIdStr);
            request.setAttribute("roomNumber", roomNumberStr);
            request.setAttribute("startDate",  startDate);
            request.setAttribute("endDate",    endDate);
            request.setAttribute("type",       type);
            request.setAttribute("error", "An unexpected error occurred: " + e.getMessage());
            request.getRequestDispatcher("/customer/booking.jsp").forward(request, response);
        }
    }
}