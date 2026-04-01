<%@ page import="java.util.*" %>
<html>
<head>
    <title>Results</title>
    <link rel="stylesheet" href="styles.css">
</head>

<body>

<jsp:include page="WEB-INF/navbar.jsp" />

<div class="container">

    <div class="card">
        <h2>Available Rooms</h2>

        <table>
            <tr>
                <th>Hotel</th>
                <th>City</th>
                <th>Capacity</th>
                <th>Price</th>
                <th>Action</th>
            </tr>

            <%
                List rooms = (List) request.getAttribute("rooms");
                if (rooms != null) {
                    for (Object r : rooms) {
            %>
            <tr>
                <td>Hotel Name</td>
                <td>City</td>
                <td>2</td>
                <td>$150</td>
                <td>
                    <form action="bookRoom" method="post">
                        <input type="hidden" name="roomId" value="1">
                        <button class="btn">Book</button>
                    </form>
                </td>
            </tr>
            <%
                    }
                }
            %>

        </table>
    </div>

</div>

</body>
</html>