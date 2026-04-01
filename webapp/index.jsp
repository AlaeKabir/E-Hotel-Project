<!DOCTYPE html>
<html>
<head>
    <title>e-Hotels</title>
    <style>
        body {
            font-family: Arial;
            background: linear-gradient(to right, #e4f0fc, #ffffff);
            text-align: center;
            margin: 0;
        }

        .container {
            width: 400px;
            margin: 80px auto;
            padding: 30px;
            background: rgb(255, 255, 255);
            border-radius: 12px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
        }

        h1 {
            color: #1e87e9;
        }

        input, button {
            width: 90%;
            padding: 10px;
            margin: 8px 0;
            border-radius: 8px;
            border: 1px solid #cccccc;
        }

        button {
            background: #1e87e9;
            color: rgb(255, 255, 255);
            border: none;
            cursor: pointer;
        }

        button:hover {
            background: #189ac2;
        }

        a {
            display: block;
            margin-top: 10px;
            color: #1ec4e9;
            text-decoration: none;
        }
    </style>
</head>

<body>

<div class="container">
    <h1>e-Hotels</h1>

    <h3>Find your perfect room</h3>

    <form action="search" method="get">
        <input type="text" name="city" placeholder="City" required>

        <input type="number" name="capacity" placeholder="Capacity (e.g. 2)" required>

        <input type="number" name="price" placeholder="Max Price ($)" required>

        <button type="submit">Search Rooms</button>
    </form>

    <a href="employee.jsp">Employee Panel</a>
    <a href="views">View Statistics</a>
</div>

</body>
</html>