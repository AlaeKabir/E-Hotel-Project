<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Add Customer</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    <link href="https://fonts.googleapis.com/css2?family=Fredoka:wght@300;400;500;600&display=swap" rel="stylesheet">
</head>

<body>
<div class="wrapper">

    <jsp:include page="/components/navbar.jsp" />

    <div class="container mt-4" style="flex:1; max-width:600px;">

        <h3 class="mb-4">Add New Customer</h3>

        <% if ("true".equals(request.getParameter("error"))) { %>
            <div class="alert alert-danger">
                ❌ Failed to add customer.
            </div>
        <% } %>

        <form action="${pageContext.request.contextPath}/employee/addCustomer" method="post">

            <div class="mb-3">
                            <label class="form-label fw-bold">Customer ID</label>
                            <input type="number" name="customer_id" class="form-control" required>
                        </div>

                        <div class="mb-3">
                            <label class="form-label fw-bold">First Name</label>
                            <input type="text" name="first_name" class="form-control" required>
                        </div>

                        <div class="mb-3">
                            <label class="form-label fw-bold">Last Name</label>
                            <input type="text" name="last_name" class="form-control" required>
                        </div>

                        <div class="mb-3">
                            <label class="form-label fw-bold">Street Number</label>
                            <input type="number" name="street_number" class="form-control" required>
                        </div>

                        <div class="mb-3">
                            <label class="form-label fw-bold">Street Name</label>
                            <input type="text" name="street_name" class="form-control" required>
                        </div>

                        <div class="mb-3">
                            <label class="form-label fw-bold">City</label>
                            <input type="text" name="city" class="form-control" required>
                        </div>

                        <div class="mb-3">
                            <label class="form-label fw-bold">Province</label>
                            <input type="text" name="province" class="form-control" required>
                        </div>

                        <div class="mb-3">
                            <label class="form-label fw-bold">ZIP</label>
                            <input type="text" name="zip" class="form-control" required>
                        </div>

                        <button type="submit" class="btn btn-primary">Add Customer</button>
                        <a href="${pageContext.request.contextPath}/employee/dashboard"
                           class="btn btn-outline-secondary ms-2">Cancel</a>

        </form>

    </div>

    <jsp:include page="/components/footer.jsp" />

</div>
</body>
</html>