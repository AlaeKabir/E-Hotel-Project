<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="com.example.model.Room" %>
<!DOCTYPE html>
<html>
<head>
    <title>Search Rooms</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>

<body>
<div class="wrapper">

    <jsp:include page="/components/navbar.jsp" />

    <div class="container mt-5" style="flex:1;">
        <div class="card-custom">

            <h3>Search Rooms</h3>

            <form action="/searchRooms" method="get" class="row g-3">

                <div class="col-md-6">
                    <label>Start Date</label>
                    <input type="date" name="startDate" class="form-control"
                           value="${param.startDate}">
                </div>

                <div class="col-md-6">
                    <label>End Date</label>
                    <input type="date" name="endDate" class="form-control"
                           value="${param.endDate}">
                </div>

                <div class="col-md-4">
                    <label>City</label>
                    <input type="text" name="city" class="form-control"
                           value="${param.city}" placeholder="e.g. Ottawa">
                </div>

                <div class="col-md-4">
                    <label>Hotel Chain</label>
                    <input type="text" name="chain" class="form-control"
                           value="${param.chain}" placeholder="e.g. Star Hotels">
                </div>

                <div class="col-md-4">
                    <label>Star Rating</label>
                    <select name="starRating" class="form-control">
                        <option value="">Any</option>
                        <option value="1" ${param.starRating == '1' ? 'selected' : ''}>1 Star</option>
                        <option value="2" ${param.starRating == '2' ? 'selected' : ''}>2 Stars</option>
                        <option value="3" ${param.starRating == '3' ? 'selected' : ''}>3 Stars</option>
                        <option value="4" ${param.starRating == '4' ? 'selected' : ''}>4 Stars</option>
                        <option value="5" ${param.starRating == '5' ? 'selected' : ''}>5 Stars</option>
                    </select>
                </div>

                <div class="col-md-4">
                    <label>Capacity</label>
                    <input type="number" name="capacity" class="form-control"
                           value="${param.capacity}" min="1">
                </div>

                <div class="col-md-4">
                    <label>Max Price ($)</label>
                    <input type="number" name="price" class="form-control"
                           value="${param.price}" min="0">
                </div>

                <div class="col-md-4">
                    <label>View Type</label>
                    <select name="viewType" class="form-control">
                        <option value="">Any</option>
                        <option value="Sea"      ${param.viewType == 'Sea'      ? 'selected' : ''}>Sea</option>
                        <option value="Mountain" ${param.viewType == 'Mountain' ? 'selected' : ''}>Mountain</option>
                    </select>
                </div>

                <div class="col-12">
                    <button class="btn btn-primary w-100">Search</button>
                </div>

            </form>
        </div>

        <%-- Results table — only shown after a search --%>
        <%
            List<Room> rooms = (List<Room>) request.getAttribute("rooms");
            if (rooms != null) {
        %>
        <div class="card-custom mt-4">
            <h5>Results (<%= rooms.size() %> room<%= rooms.size() != 1 ? "s" : "" %> found)</h5>

            <% if (rooms.isEmpty()) { %>
                <p class="text-muted">No rooms match your search criteria.</p>
            <% } else { %>
                <table class="table table-striped mt-3">
                    <thead>
                        <tr>
                            <th>Hotel ID</th>
                            <th>Room #</th>
                            <th>Price/night</th>
                            <th>Capacity</th>
                            <th>View</th>
                            <th>Extendable</th>
                            <th>Damages</th>
                            <th></th>
                        </tr>
                    </thead>
                    <tbody>
                        <% for (Room r : rooms) { %>
                        <tr>
                            <td><%= r.getHotelId() %></td>
                            <td><%= r.getRoomNumber() %></td>
                            <td>$<%= String.format("%.2f", r.getPrice()) %></td>
                            <td><%= r.getCapacity() %></td>
                            <td><%= r.getViewType() %></td>
                            <td><%= r.isExtendable() ? "Yes" : "No" %></td>
                            <td><%= r.isDamages()    ? "Yes" : "No" %></td>
                            <td>
                                <a href="/bookRoom?hotelId=<%= r.getHotelId() %>&roomNumber=<%= r.getRoomNumber() %>"
                                   class="btn btn-sm btn-success">Book</a>
                            </td>
                        </tr>
                        <% } %>
                    </tbody>
                </table>
            <% } %>
        </div>
        <% } %>

    </div>

    <jsp:include page="/components/footer.jsp" />

</div>
</body>
</html>