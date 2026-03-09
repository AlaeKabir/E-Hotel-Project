import { Navbar, Nav, Container } from 'react-bootstrap';
import { Link } from 'react-router-dom';
import './Navbar.css';

function NavigationBarFunction() {
  return (
    <>
      <Navbar className="custom-navbar" >
        <Container>
          <Navbar.Brand as={Link} to="/">e-Hotels</Navbar.Brand>
          <Nav className="ms-auto">
            <Nav.Link as={Link} to="/Search">Search Rooms</Nav.Link>
            <Nav.Link as={Link} to="/booking">Bookings</Nav.Link>
            <Nav.Link as={Link} to="/renting">Renting</Nav.Link>
            <Nav.Link as={Link} to="/customers">Customers</Nav.Link>
            <Nav.Link as={Link} to="/employees">Employees</Nav.Link>
            <Nav.Link as={Link} to="/hotels">Hotels</Nav.Link>
            <Nav.Link as={Link} to="/rooms">Rooms</Nav.Link>
            <Nav.Link as={Link} to="/views">Views</Nav.Link>
          </Nav>
        </Container>
      </Navbar>
    </>
  );
}

export default NavigationBarFunction;