<%@ page import="java.util.*, com.example.model.Room" %>

<html>
<body>

<h2>Available Rooms</h2>

<%
    List<Room> rooms = (List<Room>) request.getAttribute("rooms");
%>

<table border="1">
    <tr>
        <th>ID</th>
        <th>Price</th>
        <th>Capacity</th>
    </tr>

<%
    for (Room r : rooms) {
%>
    <tr>
        <td><%= r.getId() %></td>
        <td><%= r.getPrice() %></td>
        <td><%= r.getCapacity() %></td>
    </tr>
<%
    }
%>

</table>

</body>
</html>