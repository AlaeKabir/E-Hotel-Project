import { useState, useEffect } from "react";
import axios from "axios";

export default function SearchRooms() {
  const [rooms, setRooms] = useState([]);
  const [filters, setFilters] = useState({});

  useEffect(() => {
    fetchRooms();
  }, [filters]);

  const fetchRooms = async () => {
    const res = await axios.get(
      "http://localhost:5000/rooms/search",
      { params: filters }
    );
    setRooms(res.data);
  };

  return (
    <div>
      <h2>Search Rooms</h2>

      <select
        onChange={(e) =>
          setFilters({ ...filters, capacity: e.target.value })
        }
      >
        <option value="">Any Capacity</option>
        <option value="Single">Single</option>
        <option value="Double">Double</option>
      </select>

      <input
        placeholder="Area"
        onChange={(e) =>
          setFilters({ ...filters, area: e.target.value })
        }
      />

      <div>
        {rooms.map(room => (
          <div key={room.room_id}>
            <p>Hotel: {room.hotel_name}</p>
            <p>Price: {room.price}</p>
          </div>
        ))}
      </div>
    </div>
  );
}
