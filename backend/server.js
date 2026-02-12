const express = require("express");
const cors = require("cors");

const app = express();

app.use(cors());
app.use(express.json());

app.use("/rooms", require("./routes/rooms"));

app.listen(5000, () => {
  console.log("Server running on port 5000");
});
