import { Link } from "react-router-dom";


export default function Navbar() {
return (
<nav style={{ padding: "10px", background: "#eee" }}>
<Link to="/">Search</Link> |
<Link to="/my-bookings"> My Bookings</Link> |
<Link to="/employee"> Employee</Link> |
<Link to="/rooms-per-area"> Rooms Per Area</Link> |
<Link to="/hotel-capacity"> Hotel Capacity</Link>
</nav>
);
}