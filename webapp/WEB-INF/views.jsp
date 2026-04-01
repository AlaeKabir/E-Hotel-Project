<%@ page import="java.util.*" %>

<html>
<head>
    <style>
        body {
            font-family: Arial;
            text-align: center;
        }

        table {
            margin: auto;
            border-collapse: collapse;
            width: 60%;
        }

        th, td {
            border: 1px solid #cccccc;
            padding: 10px;
        }

        th {
            background: #1e87e9;
            color: rgb(255, 255, 255);
        }
    </style>
</head>

<body>

<h2>Available Rooms per Area</h2>

<table>
<tr><th>City</th><th>Rooms</th></tr>

<%
List<Map<String, Object>> v1 = (List<Map<String, Object>>) request.getAttribute("view1");

for (Map<String, Object> row : v1) {
%>
<tr>
    <td><%= row.get("city") %></td>
    <td><%= row.get("available_rooms") %></td>
</tr>
<%
}
%>
</table>

<h2>Total Capacity per Hotel</h2>

<table>
<tr><th>Hotel</th><th>Capacity</th></tr>

<%
List<Map<String, Object>> v2 = (List<Map<String, Object>>) request.getAttribute("view2");

for (Map<String, Object> row : v2) {
%>
<tr>
    <td><%= row.get("hotel_name") %></td>
    <td><%= row.get("total_capacity") %></td>
</tr>
<%
}
%>
</table>

</body>
</html>