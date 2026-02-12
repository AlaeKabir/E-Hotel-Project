import './App.css';
import { BrowserRouter as Router, Routes, Route } from "react-router-dom";


import Navbar from "./components/Navbar";


import SearchRooms from "./pages/SearchRooms";
import BookingPage from "./pages/BookingPage";
import MyBookings from "./pages/MyBookings";
import EmployeeDashboard from "./pages/EmployeeDashboard";
import ConvertBooking from "./pages/ConvertBooking";
import DirectRenting from "./pages/DirectRenting";
import Payments from "./pages/Payments";
import ManageCustomers from "./pages/ManageCustomers";
import ManageEmployees from "./pages/ManageEmployees";
import ManageHotels from "./pages/ManageHotels";
import ManageRooms from "./pages/ManageRooms";
import RoomsPerAreaView from "./pages/RoomsPerAreaView";
import HotelCapacityView from "./pages/HotelCapacityView";


function App() {
return (
<Router>
<Navbar />
<Routes>
<Route path="/" element={<SearchRooms />} />
<Route path="/booking" element={<BookingPage />} />
<Route path="/my-bookings" element={<MyBookings />} />
<Route path="/employee" element={<EmployeeDashboard />} />
<Route path="/convert-booking" element={<ConvertBooking />} />
<Route path="/direct-renting" element={<DirectRenting />} />
<Route path="/payments" element={<Payments />} />
<Route path="/manage-customers" element={<ManageCustomers />} />
<Route path="/manage-employees" element={<ManageEmployees />} />
<Route path="/manage-hotels" element={<ManageHotels />} />
<Route path="/manage-rooms" element={<ManageRooms />} />
<Route path="/rooms-per-area" element={<RoomsPerAreaView />} />
<Route path="/hotel-capacity" element={<HotelCapacityView />} />
</Routes>
</Router>
);
}


export default App;