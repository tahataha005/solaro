const { Router } = require("express");

//Creating a router
const router = Router();

//Importing functions from controllers
const {
    addSolarSystem,
    addItem,
    dropSolarSystem,
} = require("../controllers/control.controller.js");

//Creating routes
router.post("/system", addSolarSystem);
router.delete("/system/:id", dropSolarSystem);
router.post("/item", addItem);

module.exports = router;
