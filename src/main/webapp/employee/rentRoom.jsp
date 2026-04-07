<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Rent Room</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    <link href="https://fonts.googleapis.com/css2?family=Fredoka:wght@300;400;500;600&display=swap" rel="stylesheet">
</head>
<body>

<div class="wrapper">

<jsp:include page="/components/navbar.jsp" />

<div class="container mt-4">

    <h3>Rent Room</h3>

    <% String msg = request.getParameter("msg"); %>
    <% if ("success".equals(msg)) { %>
        <div class="alert alert-success">✔ Room rented successfully</div>
    <% } %>

    <% if ("error".equals(msg)) { %>
        <div class="alert alert-danger">❌ Failed to rent room</div>
    <% } %>

    <form action="${pageContext.request.contextPath}/employee/rentRoom" method="post" class="row g-3">

        <input type="hidden" name="type" value="renting">

        <div class="col-md-5">
            <label class="form-label">Employee ID</label>
            <input type="number" name="employeeId" class="form-control" required>
        </div>

        <div class="col-md-5">
            <label class="form-label">Customer ID</label>
            <input type="number" name="customerId" class="form-control" required>
        </div>

        <div class="col-md-4">
            <label class="form-label">Hotel ID</label>
            <input type="number" name="hotelId" class="form-control" required>
        </div>

        <div class="col-md-4">
            <label class="form-label">Room Number</label>
            <input type="number" name="roomNumber" class="form-control" required>
        </div>

        <div class="mb-3">
            <label>Check-in Date</label>
            <input type="date" name="checkin" class="form-control" required>
        </div>

        <div class="mb-3">
            <label>Check-out Date</label>
            <input type="date" name="checkout" class="form-control" required>
        </div>

        <div class="mb-3">
            <label>Payment</label>
            <input type="number" name="payment" step="0.01" class="form-control" required>
        </div>

        <div class="col-12">
            <button class="btn btn-primary">Rent Room</button>
        </div>

    </form>

</div>
<jsp:include page="/components/footer.jsp" />
</div>
</body>
</html>