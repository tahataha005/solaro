const Router = require("express");

//Creating a router
const router = Router();

//Importing functions from controllers
const {
    liveItem,
    liveSystem,
    insertItemData,
    insertSystemData,
} = require("../controllers/data.controller.js");

module.exports = router;
