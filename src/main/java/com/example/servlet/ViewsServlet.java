package com.example.servlet;

import com.example.dao.ViewDAO;
import com.example.model.Room;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet("/views")
public class ViewsServlet extends HttpServlet {

    private ViewDAO viewDAO;

    @Override
    public void init() throws ServletException {
        viewDAO = new ViewDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            List<Room> rooms = viewDAO.getAvailableRooms();

            request.setAttribute("rooms", rooms);

            request.getRequestDispatcher("/views.jsp")
                    .forward(request, response);

        } catch (Exception e) {
            throw new ServletException("Error loading available rooms", e);
        }
    }
}