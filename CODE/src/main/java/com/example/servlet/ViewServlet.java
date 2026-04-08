package com.example.servlet;

import com.example.dao.ViewDAO;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import jakarta.servlet.*;

import java.io.IOException;

@WebServlet("/employee/views")
public class ViewServlet extends HttpServlet {

    private ViewDAO dao = new ViewDAO();

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setAttribute("areas", dao.getAvailableRoomsPerArea());
        request.setAttribute("capacities", dao.getHotelCapacity());

        request.getRequestDispatcher("/employee/views.jsp").forward(request, response);
    }
}