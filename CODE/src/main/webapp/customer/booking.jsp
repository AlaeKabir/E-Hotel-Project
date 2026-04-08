<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Book Room</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    <link href="https://fonts.googleapis.com/css2?family=Fredoka:wght@300;400;500;600&display=swap" rel="stylesheet">
</head>
<body>
<div class="wrapper">

    <jsp:include page="/components/navbar.jsp" />

    <div class="container mt-5" style="flex:1;">
        <div class="card-custom" style="max-width:600px; margin:auto;">

            <h3 class="mb-1">
                <%= "renting".equals(request.getAttribute("type")) ? "Rent Room" : "Book Room" %>
            </h3>
            <p class="text-muted mb-4">
                Hotel #${hotelId} — Room #${roomNumber} &nbsp;|&nbsp;
                ${startDate} → ${endDate}
            </p>

            <% String error = (String) request.getAttribute("error");
               if (error != null) { %>
                <div class="alert alert-danger"><%= error %></div>
            <% } %>

            <form action="${pageContext.request.contextPath}/bookRoom" method="post">

                <%-- Hidden fields --%>
                <input type="hidden" name="hotelId"    value="${hotelId}">
                <input type="hidden" name="roomNumber" value="${roomNumber}">
                <input type="hidden" name="startDate"  value="${startDate}">
                <input type="hidden" name="endDate"    value="${endDate}">
                <input type="hidden" name="type"       value="${type}">

                <h5 class="mt-3">Customer Information</h5>
                <hr>

                <div class="mb-3">
                    <label class="form-label">Customer ID (9-digit SSN)</label>
                    <input type="number" name="customerId" class="form-control"
                           required min="100000000" max="999999999"
                           placeholder="e.g. 100000031">
                    <small class="text-muted">If you are a new customer, fill in the fields below. Existing customers can leave them blank.</small>
                </div>

                <%-- New customer fields — shown/hidden via JS --%>
                <div id="newCustomerFields">
                    <div class="row g-2">
                        <div class="col-md-6">
                            <label class="form-label">First Name</label>
                            <input type="text" name="firstName" class="form-control" placeholder="John">
                        </div>
                        <div class="col-md-6">
                            <label class="form-label">Last Name</label>
                            <input type="text" name="lastName" class="form-control" placeholder="Doe">
                        </div>
                        <div class="col-md-3">
                            <label class="form-label">Street #</label>
                            <input type="number" name="streetNumber" class="form-control" placeholder="123">
                        </div>
                        <div class="col-md-9">
                            <label class="form-label">Street Name</label>
                            <input type="text" name="streetName" class="form-control" placeholder="Main Street">
                        </div>
                        <div class="col-md-4">
                            <label class="form-label">City</label>
                            <input type="text" name="city" class="form-control" placeholder="Ottawa">
                        </div>
                        <div class="col-md-4">
                            <label class="form-label">Province</label>
                            <input type="text" name="province" class="form-control" placeholder="Ontario">
                        </div>
                        <div class="col-md-4">
                            <label class="form-label">Postal Code</label>
                            <input type="text" name="zip" class="form-control"
                                   placeholder="K1A1A1" pattern="[A-Za-z][0-9][A-Za-z][0-9][A-Za-z][0-9]">
                        </div>
                    </div>
                </div>

                <div class="mt-4 d-flex gap-2">
                    <button type="submit" class="btn btn-primary flex-fill">
                        Confirm <%= "renting".equals(request.getAttribute("type")) ? "Rental" : "Booking" %>
                    </button>
                    <a href="javascript:history.back()" class="btn btn-primary flex-fill">Cancel</a>
                </div>

            </form>
        </div>
    </div>

    <jsp:include page="/components/footer.jsp" />

</div>

<script>
    const idField = document.querySelector('[name="customerId"]');
    const newFields = document.getElementById('newCustomerFields');

    newFields.style.display = 'none';

    idField.addEventListener('blur', async () => {
        const id = idField.value;
        if (id.length === 9) {
            const res = await fetch(`${pageContext.request.contextPath}/checkCustomer?id=${id}`);
            const exists = await res.text();
            newFields.style.display = exists.trim() === 'true' ? 'none' : 'block';
        }
    });
</script>

</body>
</html>