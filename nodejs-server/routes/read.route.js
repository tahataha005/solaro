const { Router } = require("express");

const router = Router();

const { getSolarStats } = require("../controllers/read.controller.js");

router.get("/system/:user_id", getSolarStats);

module.exports = router;
