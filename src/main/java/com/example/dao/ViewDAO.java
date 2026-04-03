package com.example.dao;

import com.example.model.Room;

import java.util.ArrayList;
import java.util.List;

public class ViewDAO {

    public List<Room> getAvailableRooms() {

        List<Room> rooms = new ArrayList<>();

        Room r1 = new Room();
        r1.setArea("Toronto");
        r1.setCapacity(12);

        Room r2 = new Room();
        r2.setArea("Ottawa");
        r2.setCapacity(8);

        Room r3 = new Room();
        r3.setArea("Montreal");
        r3.setCapacity(15);

        rooms.add(r1);
        rooms.add(r2);
        rooms.add(r3);

        return rooms;
    }
}