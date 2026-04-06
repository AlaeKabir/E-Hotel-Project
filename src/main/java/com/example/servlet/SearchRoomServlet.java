package com.example.servlet;

import java.io.IOException;
import java.util.List;

import com.example.dao.RoomDAO;
import com.example.model.Room;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/searchRooms")
public class SearchRoomServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String city       = request.getParameter("city");
        String chain      = request.getParameter("chain");
        String viewType   = request.getParameter("viewType");
        String startDate  = request.getParameter("startDate");
        String endDate    = request.getParameter("endDate");

        int starRating = parseInt(request.getParameter("starRating"));
        int capacity   = parseInt(request.getParameter("capacity"));
        double price   = parseDouble(request.getParameter("price"));
        String extendable     = request.getParameter("extendable");
        int minHotelRooms     = parseInt(request.getParameter("minHotelRooms"));

        RoomDAO dao = new RoomDAO();
        List<Room> rooms = dao.searchRooms(city, chain, starRating, capacity, price, 
                                   viewType, startDate, endDate, 
                                   minHotelRooms, extendable);
        request.setAttribute("rooms", rooms);
        request.getRequestDispatcher("/customer/search.jsp").forward(request, response);
    }

    private int parseInt(String val) {
        try { return Integer.parseInt(val); } catch (Exception e) { return 0; }
    }

    private double parseDouble(String val) {
        try { return Double.parseDouble(val); } catch (Exception e) { return 0; }
    }
}