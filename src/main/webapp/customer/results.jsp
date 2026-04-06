<%@ page import="java.util.List" %>
<%@ page import="java.util.*, com.example.model.Room" %>
<%
    List<Room> rooms = (List<Room>) request.getAttribute("rooms");
%>
<!DOCTYPE html>
<html>
<head>
    <title>Results</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>

<body>
<div class="wrapper">

    <jsp:include page="/components/navbar.jsp" />

    <div class="container mt-5" style="flex:1;">
        <div class="card-custom">

            <h3>Available Rooms</h3>

            <table class="table table-hover mt-3">
                <tr>
                    <th>ID</th>
                    <th>Capacity</th>
                    <th>Price</th>
                    <th></th>
                </tr>

                <% for (Room r : rooms) { %>
                <tr>
                    <td><%= r.getId() %></td>
                    <td><%= r.getCapacity() %></td>
                    <td>$<%= r.getPrice() %></td>
                    <td>
                        <a class="btn btn-primary"
                           href="book.jsp?roomId=<%= r.getId() %>">
                           Book
                        </a>
                    </td>
                </tr>
                <% } %>

            </table>

        </div>
    </div>

    <jsp:include page="/components/footer.jsp" />

</div>
</body>
</html>