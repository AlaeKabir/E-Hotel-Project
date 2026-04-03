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

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String area = request.getParameter("area");
        String chain = request.getParameter("chain");
        String category = request.getParameter("category");

        int capacity = parseInt(request.getParameter("capacity"));
        double price = parseDouble(request.getParameter("price"));

        RoomDAO dao = new RoomDAO();

        List<Room> rooms = dao.searchRooms(area, chain, category, capacity, price);

        request.setAttribute("rooms", rooms);
        request.getRequestDispatcher("/customer/results.jsp").forward(request, response);
    }

    private int parseInt(String val) {
        try { return Integer.parseInt(val); } catch (Exception e) { return 0; }
    }

    private double parseDouble(String val) {
        try { return Double.parseDouble(val); } catch (Exception e) { return 0; }
    }
}