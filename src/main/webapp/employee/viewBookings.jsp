<%@ page import="java.util.List" %>
<%@ page import="com.example.model.Booking" %>
<%
    List<Booking> bookings = (List<Booking>) request.getAttribute("bookings");
%>

<html>
<head>
    <title>View Bookings</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    <link href="https://fonts.googleapis.com/css2?family=Fredoka:wght@300;400;500;600&display=swap" rel="stylesheet">
</head>
<body>

<div class="wrapper">

<jsp:include page="/components/navbar.jsp" />

<div class="container mt-4">

    <h3>Bookings</h3>

    <% if (bookings == null || bookings.isEmpty()) { %>
        <div class="alert alert-info">No bookings found</div>
    <% } else { %>

        <table class="table">
            <tr>
                <th>ID</th>
                <th>Hotel</th>
                <th>Room</th>
                <th>Dates</th>
                <th>Type</th>
            </tr>

            <% for (Booking b : bookings) { %>
            <tr>
                <td><%= b.getRentingBookingId() %></td>
                <td><%= b.getHotelId() %></td>
                <td><%= b.getRoomNumber() %></td>
                <td><%= b.getCheckinDate() %> → <%= b.getCheckoutDate() %></td>
                <td><%= b.isBooking() ? "Booking" : "Renting" %></td>
            </tr>
            <% } %>

        </table>

    <% } %>

</div>
<jsp:include page="/components/footer.jsp" />
</div>
</body>
</html>