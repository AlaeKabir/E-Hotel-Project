import { useState } from "react";

function SearchRooms() {

  const [filters, setFilters] = useState({
    startDate: "",
    endDate: "",
    capacity: "",
    area: "",
    chain: "",
    category: "",
    price: ""
  });

  const handleChange = (e) => {
    setFilters({
      ...filters,
      [e.target.name]: e.target.value
    });
  };

  const handleSearch = () => {
    console.log(filters);
    // later call backend API
  };

  return (
    <div>

      <h2>Search Rooms</h2>

      <input type="date" name="startDate" onChange={handleChange} />
      <input type="date" name="endDate" onChange={handleChange} />

      <select name="capacity" onChange={handleChange}>
        <option value="">Capacity</option>
        <option value="single">Single</option>
        <option value="double">Double</option>
      </select>

      <input
        type="text"
        name="area"
        placeholder="Area"
        onChange={handleChange}
      />

      <input
        type="number"
        name="price"
        placeholder="Max Price"
        onChange={handleChange}
      />

      <button onClick={handleSearch}>Search</button>

      <div>
        {/* search results will appear here */}
      </div>

    </div>
  );
}

export default SearchRooms;