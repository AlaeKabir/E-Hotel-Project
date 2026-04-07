package com.example.servlet;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.WebServlet;
import java.io.IOException;

@WebServlet("/employee/rentRoom")
public class EmployeeRentServlet extends HttpServlet {

    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        double payment = Double.parseDouble(req.getParameter("payment"));

        req.getRequestDispatcher("/employee/rentRoom.jsp")
                .forward(req, resp);
    }
}