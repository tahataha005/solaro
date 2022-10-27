const { Router } = require("express");

//Creating a router
const router = Router();

//Importing functions from controllers
const {
    addSolarSystem,
    addItem,
    dropSolarSystem,
    dropItem,
    editItem,
} = require("../controllers/control.controller.js");

//Creating routes
router.post("/system", addSolarSystem);
router.delete("/system/", dropSolarSystem);
router.post("/item", addItem);
router.delete("/item", dropItem);
router.put("/item", editItem);

module.exports = router;
