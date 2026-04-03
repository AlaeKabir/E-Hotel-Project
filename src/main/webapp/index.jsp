<%@ page contentType="text/html;charset=UTF-8" %>

<html>
<head>
    <title>e-Hotels Search</title>
</head>
<body>

<h1>Search Rooms</h1>

<form action="search" method="get">
    Capacity:
    <select name="capacity">
        <option value="single">Single</option>
        <option value="double">Double</option>
    </select>

    <button type="submit">Search</button>
</form>

</body>
</html>