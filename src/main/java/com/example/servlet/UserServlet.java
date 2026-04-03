package com.example.servlet;
import com.example.dao.UserDAO;
import com.example.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

//RANDOM EXAMPLE I STOLE FROM CLAUDE TO USE AS REFERENCE
// src/main/java/com/example/UserServlet.java
@WebServlet("/users")
public class UserServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        UserDAO dao = new UserDAO();
        List<User> users = dao.getAllUsers();        // calls JDBC layer

        // Option A: return JSON for JS to consume
        res.setContentType("application/json");
        PrintWriter out = res.getWriter();
        out.print(toJson(users));                   // simple manual JSON

        // Option B: forward to JSP for server-side rendering
        // req.setAttribute("users", users);
        // req.getRequestDispatcher("/WEB-INF/users.jsp").forward(req, res);
    }

    private String toJson(List<User> users) {
        StringBuilder sb = new StringBuilder("[");
        for (int i = 0; i < users.size(); i++) {
            User u = users.get(i);
            sb.append(String.format(
                "{\"id\":%d,\"name\":\"%s\",\"email\":\"%s\"}",
                u.getId(), u.getName(), u.getEmail()
            ));
            if (i < users.size() - 1) sb.append(",");
        }
        return sb.append("]").toString();
    }
}