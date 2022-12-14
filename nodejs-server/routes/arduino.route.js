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

const { readItem } = require("../controllers/read.controller.js");

//Creating routes
router.post("/item", liveItem);
router.post("/item/save", insertItemData);
router.post("/solar", liveSystem);
router.post("/solar/save", insertSystemData);
router.post("/read", readItem);

module.exports = router;
