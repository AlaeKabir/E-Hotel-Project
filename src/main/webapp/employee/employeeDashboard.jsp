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

        <% if ("customerAdded".equals(request.getParameter("success"))) { %>
            <div class="alert alert-success">
                ✅ Customer successfully added!
            </div>
        <% } %>

        <div class="row g-3">

            <div class="col-md-3">
                <a href="${pageContext.request.contextPath}/employee/search"
                   class="btn btn-primary w-100">Search Rooms</a>
            </div>

            <div class="col-md-3">
                <a href="${pageContext.request.contextPath}/employee/addCustomer"
                   class="btn btn-primary w-100">Add Customer</a>
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
                <button class="btn btn-outline-primary w-100"
                        data-bs-toggle="modal" data-bs-target="#customerIdModal">
                    View Bookings
                </button>
            </div>

            <div class="col-md-3">
                <a href="${pageContext.request.contextPath}/employee/views"
                   class="btn btn-outline-primary w-100">Views</a>
            </div>

        </div>

    </div>

    <jsp:include page="/components/footer.jsp" />

</div>

<!-- Customer ID Modal -->
<div class="modal fade" id="customerIdModal" tabindex="-1">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">View Customer Bookings</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
            </div>
            <div class="modal-body">
                <label class="form-label">Customer ID (9-digit SSN)</label>
                <input type="number" id="customerIdInput" class="form-control"
                       min="100000000" max="999999999" placeholder="e.g. 100000031">
                <div id="customerIdError" class="text-danger mt-1" style="display:none;">
                    Please enter a valid 9-digit customer ID.
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                <button type="button" class="btn btn-primary" onclick="goToBookings()">View Bookings</button>
            </div>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<script>
    function goToBookings() {
        const input = document.getElementById('customerIdInput');
        const error = document.getElementById('customerIdError');
        const id = input.value.trim();

        if (id.length !== 9 || isNaN(id)) {
            error.style.display = 'block';
            return;
        }

        error.style.display = 'none';
        window.location.href = '${pageContext.request.contextPath}/bookRoom?customerId=' + id;
    }
</script>

</body>
</html>