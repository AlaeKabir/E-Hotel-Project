<%@ page import="java.util.*" %>

<html>
<head>
    <style>
        body {
            font-family: Arial;
            background: linear-gradient(to right, #e4f0fc, #ffffff);
            text-align: center;
        }

        .card {
            background: white;
            padding: 20px;
            margin: 20px auto;
            width: 300px;
            border-radius: 12px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
        }

        button {
            background: #1e87e9;
            color: rgb(255, 255, 255);
            border: none;
            padding: 8px;
            border-radius: 6px;
            cursor: pointer;
        }
    </style>
</head>

<body>

<h2>Available Rooms</h2>

<%
List<Map<String, Object>> rooms = (List<Map<String, Object>>) request.getAttribute("rooms");

for (Map<String, Object> room : rooms) {
%>

<div class="card">
    <h3><%= room.get("hotel") %></h3>
    <p>Price: <%= room.get("price") %></p>
    <p>Capacity: <%= room.get("capacity") %></p>

    <form action="book" method="post">
        <input type="hidden" name="room_number" value="<%= room.get("room_number") %>">

        <input type="text" name="customer_id" placeholder="Customer ID" required><br>
        <input type="date" name="checkin" required><br>
        <input type="date" name="checkout" required><br>

        <button>Book</button>
    </form>
</div>

<%
}
%>

</body>
</html>