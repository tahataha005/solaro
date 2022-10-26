const Router = require("express");

const router = Router();

const { signup } = require("../controllers/auth.controller.js");
router.post("/", signup);

module.exports = router;
