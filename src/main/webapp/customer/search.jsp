<%@ page contentType="text/html;charset=UTF-8" %>
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
                    <input type="date" name="startDate" class="form-control">
                </div>

                <div class="col-md-6">
                    <label>End Date</label>
                    <input type="date" name="endDate" class="form-control">
                </div>

                <div class="col-md-4">
                    <label>Capacity</label>
                    <input type="number" name="capacity" class="form-control">
                </div>

                <div class="col-md-4">
                    <label>Area</label>
                    <input type="text" name="area" class="form-control">
                </div>

                <div class="col-md-4">
                    <label>Max Price</label>
                    <input type="number" name="price" class="form-control">
                </div>

                <div class="col-12">
                    <button class="btn btn-primary w-100">Search</button>
                </div>

            </form>

        </div>
    </div>

    <jsp:include page="/components/footer.jsp" />

</div>
</body>
</html>