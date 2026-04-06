<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Confirmation</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>
<div class="wrapper">

    <jsp:include page="/components/navbar.jsp" />

    <div class="container mt-5" style="flex:1;">
        <div class="card-custom text-center" style="max-width:500px; margin:auto;">

            <h3>
                <%= "renting".equals(request.getParameter("type")) ? "Rental Confirmed!" : "Booking Confirmed!" %>
            </h3>

            <table class="table mt-4 text-start">
                <tr><th>Hotel ID</th>    <td>${param.hotelId}</td></tr>
                <tr><th>Room #</th>      <td>${param.roomNumber}</td></tr>
                <tr><th>Check-in</th>    <td>${param.startDate}</td></tr>
                <tr><th>Check-out</th>   <td>${param.endDate}</td></tr>
                <tr><th>Type</th>
                    <td><%= "renting".equals(request.getParameter("type")) ? "Renting" : "Booking" %></td>
                </tr>
            </table>

            <a href="${pageContext.request.contextPath}/searchRooms" class="btn btn-primary mt-2 w-100">
                Search More Rooms
            </a>

        </div>
    </div>

    <jsp:include page="/components/footer.jsp" />

</div>
</body>
</html>