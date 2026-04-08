<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="com.example.model.Booking" %>
<%@ page import="com.example.dao.BookingDAO" %>
<%
    int customerId = 0;
    String fromParam = request.getParameter("customerId");
    Object fromAttr  = request.getAttribute("customerId");

    if (fromParam != null) {
        customerId = Integer.parseInt(fromParam);
    } else if (fromAttr != null) {
        customerId = (int) fromAttr;
    }

    List<Booking> bookings = customerId > 0
        ? new BookingDAO().getBookingsByCustomer(customerId)
        : (List<Booking>) request.getAttribute("bookings");

    String error   = (String) request.getAttribute("error");
    String success = (String) request.getAttribute("success");
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

        <h3 class="mb-4">Bookings & Rentings</h3>

        <% if (error != null) { %>
            <div class="alert alert-danger"><%= error %></div>
        <% } %>
        <% if (success != null) { %>
            <div class="alert alert-success"><%= success %></div>
        <% } %>

        <% if (bookings == null || bookings.isEmpty()) { %>
            <div class="alert alert-info">No bookings found.</div>
        <% } else { %>
            <table class="table table-hover align-middle">
                <thead class="table-light">
                    <tr>
                        <th>ID</th>
                        <th>Hotel ID</th>
                        <th>Room #</th>
                        <th>Check-in</th>
                        <th>Check-out</th>
                        <th>Type</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                <% for (Booking b : bookings) { %>
                    <tr>
                        <td><%= b.getRentingBookingId() %></td>
                        <td><%= b.getHotelId() %></td>
                        <td><%= b.getRoomNumber() %></td>
                        <td><%= b.getCheckinDate() %></td>
                        <td><%= b.getCheckoutDate() %></td>
                        <td>
                            <% if (b.isBooking()) { %>
                                Booking
                            <% } else { %>
                                Renting
                            <% } %>
                        </td>
                        <td>
                            <% if (b.isBooking()) { %>
                                <form action="${pageContext.request.contextPath}/convertToRenting"
                                      method="post"
                                      onsubmit="return confirm('Convert booking #<%= b.getRentingBookingId() %> to a renting?')">
                                    <input type="hidden" name="rentingBookingId" value="<%= b.getRentingBookingId() %>">
                                    <input type="hidden" name="customerId"       value="<%= customerId %>">
                                    <button type="submit" class="btn btn-primary btn-sm">
                                        Convert to Renting
                                    </button>
                                </form>
                            <% } else { %>
                                <span class="text-muted small">—</span>
                            <% } %>
                        </td>
                    </tr>
                <% } %>
                </tbody>
            </table>
        <% } %>

    </div>

    <jsp:include page="/components/footer.jsp" />
</div>
</body>
</html>