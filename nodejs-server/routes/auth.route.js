const Router = require("express");

//Creating a router
const router = Router();

//Importing functions from controllers
const { signup } = require("../controllers/auth.controller.js");

//Creating routes
router.post("/", signup);

module.exports = router;
