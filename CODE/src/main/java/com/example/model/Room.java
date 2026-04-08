package com.example.model;

public class Room {

    private int hotelId;
    private String hotelName;
    private int roomNumber;
    private double price;
    private int capacity;
    private String viewType;
    private boolean extendable;
    private boolean damages;

    public Room() {}

    public int getHotelId() { return hotelId; }
    public void setHotelId(int hotelId) { this.hotelId = hotelId; }

    public String getHotelName() { return hotelName; }
    public void setHotelName(String hotelName) { this.hotelName = hotelName; }

    public int getRoomNumber() { return roomNumber; }
    public void setRoomNumber(int roomNumber) { this.roomNumber = roomNumber; }

    public double getPrice() { return price; }
    public void setPrice(double price) { this.price = price; }

    public int getCapacity() { return capacity; }
    public void setCapacity(int capacity) { this.capacity = capacity; }

    public String getViewType() { return viewType; }
    public void setViewType(String viewType) { this.viewType = viewType; }

    public boolean isExtendable() { return extendable; }
    public void setExtendable(boolean extendable) { this.extendable = extendable; }

    public boolean isDamages() { return damages; }
    public void setDamages(boolean damages) { this.damages = damages; }
}