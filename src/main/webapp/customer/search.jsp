<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Set" %>
<%@ page import="com.example.model.Room" %>
<%
    List<Room> rooms        = (List<Room>) request.getAttribute("rooms");
    Set<String> mostExp     = (Set<String>) request.getAttribute("mostExpensive");
    Integer cityAvailable   = (Integer) request.getAttribute("cityAvailable");
    String cityName         = (String)  request.getAttribute("cityName");
    if (mostExp == null) mostExp = new java.util.HashSet<>();
%>
<!DOCTYPE html>
<html>
<head>
    <title>Search Rooms</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    <style>
        .room-card { border: 1px solid #dee2e6; border-radius: 8px; padding: 16px; margin-bottom: 12px; }
        .filter-section { background: #f8f9fa; border-radius: 8px; padding: 20px; margin-bottom: 20px; }
    </style>
</head>
<body>
<div class="wrapper">

    <jsp:include page="/components/navbar.jsp" />

    <div class="container mt-4" style="flex:1;">

        <h3 class="mb-4">Search Available Rooms</h3>

        <%-- FILTER FORM --%>
        <div class="filter-section">
            <form action="${pageContext.request.contextPath}/searchRooms" method="get" class="row g-3">

                <div class="col-md-3">
                    <label class="form-label fw-bold">Check-in Date</label>
                    <input type="date" name="startDate" class="form-control"
                           value="${param.startDate}" min="<%= java.time.LocalDate.now() %>">
                </div>
                <div class="col-md-3">
                    <label class="form-label fw-bold">Check-out Date</label>
                    <input type="date" name="endDate" class="form-control"
                           value="${param.endDate}" min="<%= java.time.LocalDate.now().plusDays(1) %>">
                </div>

                <div class="col-md-3">
                    <label class="form-label fw-bold">City / Area</label>
                    <input type="text" name="city" class="form-control"
                           value="${param.city}" placeholder="e.g. Ottawa">
                </div>

                <div class="col-md-3">
                    <label class="form-label fw-bold">Hotel Chain</label>
                    <input type="text" name="chain" class="form-control"
                           value="${param.chain}" placeholder="e.g. Star Hotels">
                </div>

                <div class="col-md-2">
                    <label class="form-label fw-bold">Category (Stars)</label>
                    <select name="starRating" class="form-select">
                        <option value="">Any</option>
                        <option value="1" ${param.starRating == '1' ? 'selected' : ''}>1 Star</option>
                        <option value="2" ${param.starRating == '2' ? 'selected' : ''}>2 Stars</option>
                        <option value="3" ${param.starRating == '3' ? 'selected' : ''}>3 Stars</option>
                        <option value="4" ${param.starRating == '4' ? 'selected' : ''}>4 Stars</option>
                        <option value="5" ${param.starRating == '5' ? 'selected' : ''}>5 Stars</option>
                    </select>
                </div>

                <div class="col-md-2">
                    <label class="form-label fw-bold">Min Capacity</label>
                    <input type="number" name="capacity" class="form-control"
                           value="${param.capacity}" min="1" max="5" placeholder="1-5">
                </div>

                <div class="col-md-2">
                    <label class="form-label fw-bold">Max Price ($/night)</label>
                    <input type="number" name="price" class="form-control"
                           value="${param.price}" min="0" placeholder="e.g. 300">
                </div>

                <div class="col-md-2">
                    <label class="form-label fw-bold">View Type</label>
                    <select name="viewType" class="form-select">
                        <option value="">Any</option>
                        <option value="Sea"      ${param.viewType == 'Sea'      ? 'selected' : ''}>Sea</option>
                        <option value="Mountain" ${param.viewType == 'Mountain' ? 'selected' : ''}>Mountain</option>
                    </select>
                </div>

                <div class="col-md-2">
                    <label class="form-label fw-bold">Min Rooms in Hotel</label>
                    <input type="number" name="minHotelRooms" class="form-control"
                           value="${param.minHotelRooms}" min="1" placeholder="e.g. 5">
                </div>

                <div class="col-md-2 d-flex align-items-end">
                    <div class="form-check mb-2">
                        <input class="form-check-input" type="checkbox" name="extendable"
                               value="true" ${param.extendable == 'true' ? 'checked' : ''}>
                        <label class="form-check-label fw-bold">Extendable Only</label>
                    </div>
                </div>

                <div class="col-12 d-flex gap-2">
                    <button type="submit" class="btn btn-primary px-5">Search</button>
                    <a href="${pageContext.request.contextPath}/searchRooms"
                       class="btn btn-outline-secondary">Clear</a>
                </div>

            </form>
        </div>

        <%-- CITY AVAILABILITY BANNER --%>
        <% if (cityAvailable != null) { %>
        <div class="city-banner">
            <strong><%= cityName %></strong> has
            <strong><%= cityAvailable %></strong>
            available room<%= cityAvailable != 1 ? "s" : "" %>
            <% if (request.getParameter("startDate") != null && !request.getParameter("startDate").isEmpty()) { %>
                from <strong>${param.startDate}</strong> to <strong>${param.endDate}</strong>
            <% } %>
        </div>
        <% } %>

        <%-- RESULTS --%>
        <% if (rooms != null) { %>
            <h5 class="mb-3">
                <%= rooms.size() %> room<%= rooms.size() != 1 ? "s" : "" %> found
            </h5>

            <% if (rooms.isEmpty()) { %>
                <div class="alert alert-info">
                    No rooms match your search criteria. Try adjusting your filters.
                </div>
            <% } else { %>
                <div class="row">
                <% for (Room r : rooms) {
                       boolean isTopPrice = mostExp.contains(r.getHotelId() + "-" + r.getRoomNumber());
                %>
                    <div class="col-md-6">
                        <div class="room-card">
                            <div class="d-flex justify-content-between align-items-start">
                                <div>
                                    <h6 class="mb-1">
                                        <%= r.getHotelName() %> — Room <%= r.getRoomNumber() %>
                                    </h6>
                                    <small class="text-muted"><%= r.getViewType() %> view</small>
                                </div>
                                <div class="text-end">
                                    <span class="fs-5 fw-bold text-primary">
                                        $<%= String.format("%.2f", r.getPrice()) %>/night
                                    </span>
                                    <% if (isTopPrice) { %>
                                        <br>
                                        <span class="badge-primary">$$ Most Expensive in Hotel</span>
                                    <% } %>
                                </div>
                            </div>
                            <hr class="my-2">
                            <div class="row">
                                <div class="col-6">
                                    <small>Capacity: <strong><%= r.getCapacity() %></strong></small>
                                </div>
                                <div class="col-6">
                                    <small>Extendable: <strong><%= r.isExtendable() ? "Yes" : "No" %></strong></small>
                                </div>
                                <div class="col-6 mt-1">
                                    <small>Damages: <strong><%= r.isDamages() ? "Yes" : "No" %></strong></small>
                                </div>
                            </div>
                            <div class="mt-3 d-flex gap-2">
                                <a href="${pageContext.request.contextPath}/bookRoom?hotelId=<%= r.getHotelId() %>&roomNumber=<%= r.getRoomNumber() %>&startDate=${param.startDate}&endDate=${param.endDate}&type=booking"
                                   class="btn btn-primary btn-sm flex-fill">Book</a>
                                <a href="${pageContext.request.contextPath}/bookRoom?hotelId=<%= r.getHotelId() %>&roomNumber=<%= r.getRoomNumber() %>&startDate=${param.startDate}&endDate=${param.endDate}&type=renting"
                                   class="btn btn-outline-primary btn-sm flex-fill">Rent</a>
                            </div>
                        </div>
                    </div>
                <% } %>
                </div>
            <% } %>
        <% } %>

    </div>

    <jsp:include page="/components/footer.jsp" />

</div>

<script>
    document.querySelectorAll('select').forEach(sel => {
        sel.addEventListener('change', () => sel.closest('form').submit());
    });
</script>

</body>
</html>