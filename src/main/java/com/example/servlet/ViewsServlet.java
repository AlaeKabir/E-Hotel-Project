package com.example.servlet;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.WebServlet;
import java.io.IOException;

@WebServlet("/views")   // 👈 RIGHT HERE
public class ViewsServlet extends HttpServlet {

    protected void doGet(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        ViewDAO dao = new ViewDAO();

        req.setAttribute("view1", dao.getAvailableRooms());
        req.setAttribute("view2", dao.getCapacity());

        req.getRequestDispatcher("/WEB-INF/views.jsp").forward(req, res);
    }
}