package com.example.servlet;

import com.example.dao.CustomerDAO;
import com.example.model.Customer;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import jakarta.servlet.*;

import java.io.IOException;
import java.time.LocalDate;

@WebServlet("/employee/addCustomer")
public class AddCustomerServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.getRequestDispatcher("/employee/addCustomer.jsp")
                .forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            Customer c = new Customer();

            c.setCustomerId(Integer.parseInt(request.getParameter("customer_id")));
            c.setFirstName(request.getParameter("first_name"));
            c.setLastName(request.getParameter("last_name"));
            c.setStreetNumber(Integer.parseInt(request.getParameter("street_number")));
            c.setStreetName(request.getParameter("street_name"));
            c.setCity(request.getParameter("city"));
            c.setProvince(request.getParameter("province"));
            c.setZip(request.getParameter("zip"));

            CustomerDAO dao = new CustomerDAO();

            if (dao.registerCustomer(c)) {
                response.sendRedirect(request.getContextPath() + "/employee/dashboard?success=customerAdded");
            } else {
                response.sendRedirect(request.getContextPath() + "/employee/addCustomer?error=true");
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("❌ Error: " + e.getMessage());
        }
    }
}