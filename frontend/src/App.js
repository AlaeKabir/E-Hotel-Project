import { HashRouter as Router, Routes, Route } from 'react-router-dom';
import NavigationBar from './components/Navbar';
import Footer from './components/Footer';
import Home from "./pages/Home";
import SearchRooms from "./pages/SearchRooms";
import Booking from "./pages/Booking";
import Renting from "./pages/Renting";
import Customers from "./pages/Customers";
import Employees from "./pages/Employees";
import Hotels from "./pages/Hotels";
import Rooms from "./pages/Rooms";
import Views from "./pages/Views";
import './App.css';

function App() {
  return (
    <Router>
      <div className="wrapper">
        <NavigationBar />
        <div>
          <Routes>
            <Route path="/" element={<Home />} />
            <Route path="/search" element={<SearchRooms />} />
            <Route path="/booking" element={<Booking />} />
            <Route path="/renting" element={<Renting />} />
            <Route path="/customers" element={<Customers />} />
            <Route path="/employees" element={<Employees />} />
            <Route path="/hotels" element={<Hotels />} />
            <Route path="/rooms" element={<Rooms />} />
            <Route path="/views" element={<Views />} />
          </Routes>
        </div>
        <Footer />
      </div>
    </Router>
  );
}

export default App;