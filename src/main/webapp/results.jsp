<div class="card">
    <h2>Available Rooms</h2>

    <%
        List rooms = (List) request.getAttribute("rooms");
        if (rooms == null || rooms.isEmpty()) {
    %>

        <div class="empty">No rooms found 😕</div>

    <%
        } else {
    %>

    <table>
        <tr>
            <th>Hotel</th>
            <th>City</th>
            <th>Guests</th>
            <th>Price</th>
            <th></th>
        </tr>

        <% for (Object r : rooms) { %>
        <tr>
            <td>Hilton</td>
            <td>Toronto</td>
            <td>2</td>
            <td class="price">$150</td>
            <td>
                <form action="bookRoom" method="post">
                    <button class="btn">Book</button>
                </form>
            </td>
        </tr>
        <% } %>

    </table>

    <% } %>
</div>