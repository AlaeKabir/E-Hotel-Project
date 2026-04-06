<%@ page import="java.util.List" %>
<%@ page import="com.example.model.Room" %>
<%
    List<Room> rooms = (List<Room>) request.getAttribute("rooms");
%>
<!DOCTYPE html>
<html>
<head>
    <title>Available Rooms</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>
<div class="wrapper">

    <jsp:include page="/components/navbar.jsp" />

    <div class="container mt-5" style="flex:1;">
        <div class="card-custom">

            <h3>Available Rooms</h3>

            <% if (rooms == null || rooms.isEmpty()) { %>
                <div class="alert alert-info mt-3">No rooms found.</div>
            <% } else { %>
            <table class="table table-hover mt-3">
                <thead>
                <tr>
                    <th>Hotel Name</th>
                    <th>Room #</th>
                    <th>Capacity</th>
                    <th>Price/night</th>
                    <th>View</th>
                    <th>Extendable</th>
                    <th>Damages</th>
                    <th></th>
                </tr>
                </thead>
                <tbody>
                <% for (Room r : rooms) { %>
                <tr>
                    <td><%= r.getHotelName() %></td>
                    <td><%= r.getRoomNumber() %></td>
                    <td><%= r.getCapacity() %></td>
                    <td>$<%= String.format("%.2f", r.getPrice()) %></td>
                    <td><%= r.getViewType() %></td>
                    <td><%= r.isExtendable() ? "Yes" : "No" %></td>
                    <td><%= r.isDamages()    ? "Yes" : "No" %></td>
                    <td class="d-flex gap-1">
                        <a class="btn btn-success btn-sm"
                           href="${pageContext.request.contextPath}/bookRoom?hotelId=<%= r.getHotelId() %>&roomNumber=<%= r.getRoomNumber() %>&startDate=${param.startDate}&endDate=${param.endDate}&type=booking">
                           Book
                        </a>
                        <a class="btn btn-outline-primary btn-sm"
                           href="${pageContext.request.contextPath}/bookRoom?hotelId=<%= r.getHotelId() %>&roomNumber=<%= r.getRoomNumber() %>&startDate=${param.startDate}&endDate=${param.endDate}&type=renting">
                           Rent
                        </a>
                    </td>
                </tr>
                <% } %>
                </tbody>
            </table>
            <% } %>

        </div>
    </div>

    <jsp:include page="/components/footer.jsp" />

</div>
</body>
</html>