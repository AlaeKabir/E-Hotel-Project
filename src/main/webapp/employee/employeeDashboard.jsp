<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Employee Dashboard</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    <link href="https://fonts.googleapis.com/css2?family=Fredoka:wght@300;400;500;600&display=swap" rel="stylesheet">
</head>
<body>

<div class="wrapper">

    <jsp:include page="/components/navbar.jsp" />

    <div class="container mt-4" style="flex:1;">

        <h3 class="mb-4">Employee Dashboard</h3>

        <div class="row g-3">

            <div class="col-md-3">
                <a href="${pageContext.request.contextPath}/employee/search"
                   class="btn btn-primary w-100">Search Rooms</a>
            </div>

            <div class="col-md-3">
                <a href="${pageContext.request.contextPath}/employee/createBooking"
                   class="btn btn-primary w-100">Create Booking</a>
            </div>

            <div class="col-md-3">
                <a href="${pageContext.request.contextPath}/employee/rentRoom"
                   class="btn btn-primary w-100">Rent Room</a>
            </div>

            <div class="col-md-3">
                <a href="${pageContext.request.contextPath}/employee/viewBookings"
                   class="btn btn-outline-primary w-100">View Bookings</a>
            </div>

        </div>

    </div>

    <jsp:include page="/components/footer.jsp" />

</div>

</body>
</html>