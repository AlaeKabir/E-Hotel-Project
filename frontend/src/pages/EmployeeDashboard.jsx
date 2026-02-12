import { Link } from "react-router-dom";


export default function EmployeeDashboard() {
return (
<div>
<h2>Employee Dashboard</h2>
<ul>
<li><Link to="/convert-booking">Convert Booking</Link></li>
<li><Link to="/direct-renting">Direct Renting</Link></li>
<li><Link to="/payments">Payments</Link></li>
<li><Link to="/manage-customers">Manage Customers</Link></li>
<li><Link to="/manage-employees">Manage Employees</Link></li>
<li><Link to="/manage-hotels">Manage Hotels</Link></li>
<li><Link to="/manage-rooms">Manage Rooms</Link></li>
</ul>
</div>
);
}