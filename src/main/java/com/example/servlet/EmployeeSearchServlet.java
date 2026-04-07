package com.example.servlet;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.WebServlet;
import java.io.IOException;

@WebServlet("/employee/search")
public class EmployeeSearchServlet extends HttpServlet {

    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        // reuse SAME search page
        req.getRequestDispatcher("/customer/search.jsp")
                .forward(req, resp);
    }
}