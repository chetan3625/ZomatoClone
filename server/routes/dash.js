const express = require("express");
const router = express.Router();

router.get("/dashboard", (req, res) => {
  res.json({"message":"Hello World","status":"success"});
});

module.exports = router;
