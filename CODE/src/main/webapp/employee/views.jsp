<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.List" %>

<%
    List<String> areas = (List<String>) request.getAttribute("areas");
    List<String> capacities = (List<String>) request.getAttribute("capacities");
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Views</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    <link href="https://fonts.googleapis.com/css2?family=Fredoka:wght@300;400;500;600&display=swap" rel="stylesheet">
</head>
<body>
<div class="wrapper">

    <jsp:include page="/components/navbar.jsp" />

    <div class="container mt-4" style="flex:1;">

        <h3 class="mb-3">Available Rooms per Area</h3>

            <% if (areas == null || areas.isEmpty()) { %>
                <div class="alert alert-warning">No data found</div>
            <% } else { %>
                <ul class="list-group mb-4">
                    <% for(String a : areas) { %>
                        <li class="list-group-item"><%= a %></li>
                    <% } %>
                </ul>
            <% } %>


            <h3 class="mb-3">Hotel Total Capacity</h3>

            <% if (capacities == null || capacities.isEmpty()) { %>
                <div class="alert alert-warning">No data found</div>
            <% } else { %>
                <ul class="list-group">
                    <% for(String c : capacities) { %>
                        <li class="list-group-item"><%= c %></li>
                    <% } %>
                </ul>
            <% } %>

        <div class="mt-4 d-flex gap-2">
            <a href="javascript:history.back()" class="btn btn-primary mt-2 w-100">Cancel</a>
        </div>

    </div>

    <jsp:include page="/components/footer.jsp" />

</div>
</body>
</html>