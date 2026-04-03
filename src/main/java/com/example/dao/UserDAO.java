package com.example.dao;

import com.example.model.User;
import java.util.ArrayList;
import java.util.List;

public class UserDAO {

    public List<User> getAllUsers() {

        List<User> users = new ArrayList<>();

        // dummy data for now (replace later with DB)
        users.add(new User(1, "Alice Johnson", "alice@email.com"));
        users.add(new User(2, "Bob Smith", "bob@email.com"));

        return users;
    }
}