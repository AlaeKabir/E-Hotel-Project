const router = require("express").Router();
const pool = require("../db");

router.get("/search", async (req, res) => {
  try {
    const { capacity, area, minprice, maxprice } = req.query;

    const result = await pool.query(
      `SELECT * FROM room r
       JOIN hotel h ON r.hotel_id = h.hotel_id
       WHERE ($1::text IS NULL OR r.capacity = $1)
       AND ($2::text IS NULL OR h.area = $2)
       AND ($3::int IS NULL OR r.price >= $3)
       AND ($4::int IS NULL OR r.price <= $4)`,
      [capacity || null, area || null, minprice || null, maxprice || null]
    );

    res.json(result.rows);
  } catch (err) {
    console.error(err);
  }
});

module.exports = router;
