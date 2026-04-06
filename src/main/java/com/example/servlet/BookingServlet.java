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

        request.setAttribute("hotelId",    request.getParameter("hotelId"));
        request.setAttribute("roomNumber", request.getParameter("roomNumber"));
        request.setAttribute("startDate",  request.getParameter("startDate"));
        request.setAttribute("endDate",    request.getParameter("endDate"));
        request.setAttribute("type",       request.getParameter("type")); 

        request.getRequestDispatcher("/customer/booking.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            int hotelId      = Integer.parseInt(request.getParameter("hotelId"));
            int roomNumber   = Integer.parseInt(request.getParameter("roomNumber"));
            int customerId   = Integer.parseInt(request.getParameter("customerId"));
            String startDate = request.getParameter("startDate");
            String endDate   = request.getParameter("endDate");
            String type      = request.getParameter("type"); //"booking" or "renting"
            boolean isBooking = "booking".equals(type);
            
            //I DONT LIKE THIS AND WILL CHANGE

            //Employee 100000001 as default — in real app would come from session
            int employeeId = 100000001;

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
            boolean success = bookingDAO.insertBooking(booking);

            if (success) {
                response.sendRedirect(request.getContextPath() + "/customer/confirmation.jsp" +
                        "?type=" + type +
                        "&hotelId=" + hotelId +
                        "&roomNumber=" + roomNumber +
                        "&startDate=" + startDate +
                        "&endDate=" + endDate);
            } else {
                request.setAttribute("error", "Booking failed. The room may no longer be available.");
                request.getRequestDispatcher("/customer/booking.jsp").forward(request, response);
            }

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "An error occurred: " + e.getMessage());
            request.getRequestDispatcher("/customer/booking.jsp").forward(request, response);
        }
    }
}