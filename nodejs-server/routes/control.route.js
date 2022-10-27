const { Router } = require("express");

//Creating a router
const router = Router();

//Importing functions from controllers
const { addSolarSystem } = require("../controllers/control.controller.js");

//Creating routes
router.post("/system", addSolarSystem);

module.exports = router;
