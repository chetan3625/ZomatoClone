const express = require("express");
const dash = require("./routes/dash");
const mongoose=require("mongoose");
const auth = require("./routes/auth");
const DB ="mongodb+srv://chetan3625:chetan3625@cluster0.jor4knb.mongodb.net/?appName=Cluster0";


const app = express();
const PORT = 3000;

// Home route
app.get("/", function (req, res) {
  res.send("Hello World");
});

// Use dashboard routes
app.use(dash);
app.use(express.json());
app.use(auth);

//mongodb+srv://chetan3625:chetan3625@cluster0.jor4knb.mongodb.net/?appName=Cluster0
mongoose.connect(DB).then(()=>{
  console.log("Connection to Database Successful");
}).catch((err)=>{
  console.log(err.message);
})

// Start server
app.listen(PORT, "0.0.0.0", function () {
  console.log("Server started on port " + PORT);
});
