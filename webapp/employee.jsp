<html>
<head>
    <style>
        body {
            font-family: Arial;
            background: linear-gradient(to right, #e4f0fc, #ffffff);
            text-align: center;
        }

        .box {
            width: 350px;
            margin: 40px auto;
            padding: 20px;
            background: rgb(255, 255, 255);
            border-radius: 10px;
        }

        input, button {
            margin: 5px;
            padding: 8px;
        }

        button {
            background: #1e87e9;
            color: rgb(255, 255, 255);
            border: none;
        }
    </style>
</head>

<body>

<h1>Employee Panel</h1>

<div class="box">
    <h3>Convert Booking → Renting</h3>

    <form action="convert" method="post">
        <input type="number" name="bookingId" placeholder="Booking ID"><br>
        <input type="number" name="employeeSSN" placeholder="Employee SSN"><br>
        <button>Convert</button>
    </form>
</div>

<div class="box">
    <h3>Walk-in Renting</h3>

    <form action="rent" method="post">
        <input type="number" name="room_number" placeholder="Room #"><br>
        <input type="text" name="customer_id" placeholder="Customer ID"><br>
        <input type="date" name="checkin"><br>
        <input type="date" name="checkout"><br>
        <input type="number" name="employeeSSN" placeholder="Employee SSN"><br>
        <button>Rent</button>
    </form>
</div>

</body>
</html>