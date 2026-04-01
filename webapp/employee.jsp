<html>
<head>
    <title>Employee Panel</title>
    <link rel="stylesheet" href="styles.css">
</head>

<body>

<jsp:include page="WEB-INF/navbar.jsp" />

<div class="container">

    <div class="card">
        <h2>Convert Booking to Renting</h2>

        <form action="convertBooking" method="post">
            <div class="form-group">
                <label>Booking ID</label>
                <input type="number" name="bookingId">
            </div>

            <button class="btn">Convert</button>
        </form>
    </div>

    <div class="card">
        <h2>Walk-in Renting</h2>

        <form action="walkIn" method="post">

            <div class="form-group">
                <label>Customer Name</label>
                <input type="text" name="customer">
            </div>

            <div class="form-group">
                <label>Room ID</label>
                <input type="number" name="roomId">
            </div>

            <button class="btn">Rent</button>
        </form>
    </div>

</div>

</body>
</html>