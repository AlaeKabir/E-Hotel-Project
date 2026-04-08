//This is to check if a customer exists
package com.example.servlet;

import java.io.IOException;

import com.example.dao.CustomerDAO;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/checkCustomer")
public class CheckCustomerServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws IOException {
        String idParam = request.getParameter("id");
        boolean exists = false;
        try {
            int id = Integer.parseInt(idParam);
            exists = new CustomerDAO().getCustomerById(id) != null;
        } catch (Exception ignored) {}
        response.getWriter().write(String.valueOf(exists));
    }
}