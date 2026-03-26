const { Pool } = require("pg");

const pool = new Pool({
  user: "postgres",
  password: "ChipOcelot11:)!!",
  host: "localhost",
  port: 5432,
  database: "ehotels_project"
});

module.exports = pool;
