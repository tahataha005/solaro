const { Router } = require("express");

//Creating a router
const router = Router();

//Importing functions from controllers
const {
    addSolarSystem,
    addItem,
} = require("../controllers/control.controller.js");

//Creating routes
router.post("/system", addSolarSystem);
router.post("/item", addItem);

module.exports = router;
