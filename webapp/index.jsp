<%@ page language="java" %>
<html>
<head>
    <title>e-Hotels</title>
    <link rel="stylesheet" href="styles.css">
</head>

<body>

<jsp:include page="WEB-INF/navbar.jsp" />

<div class="container">

    <div class="card">
        <h2>Search Rooms</h2>

        <form action="searchRooms" method="get">

            <div class="form-group">
                <label>City</label>
                <select name="city">
                    <option value="">Select City</option>
                    <option>Toronto</option>
                    <option>Montreal</option>
                    <option>Vancouver</option>
                </select>
            </div>

            <div class="form-group">
                <label>Capacity</label>
                <select name="capacity">
                    <option value="">Any</option>
                    <option>1</option>
                    <option>2</option>
                    <option>4</option>
                </select>
            </div>

            <div class="form-group">
                <label>Max Price ($)</label>
                <input type="number" name="price" placeholder="e.g. 200">
            </div>

            <button class="btn">Search</button>

        </form>
    </div>

</div>

</body>
</html>