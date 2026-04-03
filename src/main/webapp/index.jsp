<%@ page language="java" %>
<html>
<head>
    <title>Search Rooms</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/styles.css">
</head>

<body>

<jsp:include page="/WEB-INF/navbar.jsp" />

<div class="container">

    <div class="card">
        <h2>Find your perfect stay</h2>

        <form action="searchRooms" method="get">

            <div class="form-row">

                <div class="form-group">
                    <label>City</label>
                    <select name="city">
                        <option>Toronto</option>
                        <option>Montreal</option>
                        <option>Vancouver</option>
                    </select>
                </div>

                <div class="form-group">
                    <label>Guests</label>
                    <select name="capacity">
                        <option>1</option>
                        <option>2</option>
                        <option>4</option>
                    </select>
                </div>

                <div class="form-group">
                    <label>Max Price</label>
                    <input type="number" name="price" placeholder="$200">
                </div>

            </div>

            <button class="btn">Search Rooms</button>

        </form>
    </div>

</div>

</body>
</html>