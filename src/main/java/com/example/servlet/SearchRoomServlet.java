package com.example.servlet;

import com.example.dao.RoomDAO;
import com.example.model.Room;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet("/searchRooms")
public class SearchRoomServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String capacityParam = request.getParameter("capacity");

        int capacity = 0;

        try {
            capacity = Integer.parseInt(capacityParam);
        } catch (Exception e) {
            request.setAttribute("error", "Invalid capacity value");
            request.getRequestDispatcher("result.jsp").forward(request, response);
            return;
        }

        RoomDAO dao = new RoomDAO();
        List<Room> rooms = dao.searchAvailableRooms(capacity);

        request.setAttribute("rooms", rooms);

        request.getRequestDispatcher("result.jsp")
                .forward(request, response);
    }
}