const { Pool } = require("pg");

const pool = new Pool({
  user: "postgres",
  password: "theminiyeteh",
  host: "localhost",
  port: 5432,
  database: "ehotels"
});

module.exports = pool;
